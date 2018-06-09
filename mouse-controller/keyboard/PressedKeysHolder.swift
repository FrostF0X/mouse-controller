//
// Created by Dmytro Konovalov on 6/1/18.
// Copyright (c) 2018 Dmytro Konovalov. All rights reserved.
//

import Foundation

class PressedKeysHolder {

    private var pressedKeys: Set<Int> = [];

    public func getPressedKeys() -> Set<Int> {
        return pressedKeys;
    }

    public func keyPressed(event: CGEvent) {
        pressedKeys.insert(createMovementFromEvent(event: event));
    }

    public func keyReleased(event: CGEvent) {
        pressedKeys.remove(createMovementFromEvent(event: event));
    }

    private func createMovementFromEvent(event: CGEvent) -> Int {
        return EventUtils.getKeyCodeFromEvent(event: event);
    }
}
