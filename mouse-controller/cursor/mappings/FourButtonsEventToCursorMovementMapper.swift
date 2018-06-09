//
// Created by Dmytro Konovalov on 5/31/18.
// Copyright (c) 2018 Dmytro Konovalov. All rights reserved.
//

import Foundation

class FourButtonsEventToCursorMovementMapper: EventToCursorMovementMapper {

    private var pressedKeysHolder: PressedKeysHolder;
    private var lastMovements: Set<CursorMovement>;

    init() {
        self.pressedKeysHolder = PressedKeysHolder();
        lastMovements = [];
    }

    public func keyPressed(event: CGEvent) {
        pressedKeysHolder.keyPressed(event: event);
    }

    public func keyReleased(event: CGEvent) {
        pressedKeysHolder.keyReleased(event: event);
    }

    public func getMovement() -> CursorMovement {
        lastMovements = keyCodesToMovements(keyCodes: pressedKeysHolder.getPressedKeys());
        return CursorMovement.sum(lastMovements);
    }

    public func shouldStopPropagation() -> Bool {
        if(lastMovements.count == 0){
            return false;
        } else if (lastMovements.count == 1){
            return lastMovements.first != CursorMovement.None;
        }
        return true;
    }

    func keyCodesToMovements(keyCodes: Set<Int>) -> Set<CursorMovement> {
        return Set(keyCodes.map({ return createMovementFromKeyCode(keyCode: $0) }));
    }

    private func createMovementFromKeyCode(keyCode: Int) -> CursorMovement {
        return CursorMovementFactory.createBasicFromKeyCode(keyCode: keyCode);
    }
}