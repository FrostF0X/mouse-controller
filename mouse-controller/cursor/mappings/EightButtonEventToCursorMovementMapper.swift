//
// Created by Dmytro Konovalov on 5/31/18.
// Copyright (c) 2018 Dmytro Konovalov. All rights reserved.
//

import Foundation

class EightButtonsEventToCursorMovementMapper: EventToCursorMovementMapper {

    private let pressedKeyHolder: LastPressedKeyCodeHolder;
    private var lastMovement: CursorMovement;

    init() {
        pressedKeyHolder = LastPressedKeyCodeHolder();
        lastMovement = CursorMovement.None;
    }

    func keyPressed(event: CGEvent) {
        pressedKeyHolder.keyPressed(event: event);
    }

    func keyReleased(event: CGEvent) {
        pressedKeyHolder.keyReleased(event: event);
    }

    func getMovement() -> CursorMovement {
        self.lastMovement = createMovementFromKeyCode(keyCode: pressedKeyHolder.getLastKeyCode());
        return lastMovement;
    }

    private func createMovementFromKeyCode(keyCode: Int) -> CursorMovement {
        return CursorMovementFactory.createFromKeyCode(keyCode: keyCode);
    }

    func shouldStopPropagation() -> Bool {
        return lastMovement != CursorMovement.None;
    }
}