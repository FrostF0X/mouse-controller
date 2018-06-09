//
// Created by Dmytro Konovalov on 6/2/18.
// Copyright (c) 2018 Dmytro Konovalov. All rights reserved.
//

import Foundation

class LastPressedKeyCodeHolder {
    private static let emptyKeyCode = -1;
    private var lastPressedKeyCode: Int = emptyKeyCode;

    func getLastKeyCode() -> Int {
        return lastPressedKeyCode;
    }

    func keyPressed(event: CGEvent) {
        lastPressedKeyCode = getKeyCode(event: event);
    }

    func keyReleased(event: CGEvent) {
        if (getKeyCode(event: event) == lastPressedKeyCode) {
            lastPressedKeyCode = LastPressedKeyCodeHolder.emptyKeyCode;
        }
    }

    private func getKeyCode(event: CGEvent) -> Int {
        return EventUtils.getKeyCodeFromEvent(event: event)
    }

}
