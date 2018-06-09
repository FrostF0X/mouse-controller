//
// Created by Dmytro Konovalov on 6/1/18.
// Copyright (c) 2018 Dmytro Konovalov. All rights reserved.
//

import Foundation

class MouseActionMapper {

    public var lastActionType: ActionType = ActionType.Pressed;
    public var lastRegisteredKeyCode: Int = 0;
    public var lastAction: MouseAction = MouseAction.None;

    public func keyPressed(event: CGEvent) {
        lastActionType = ActionType.Pressed;
        lastRegisteredKeyCode = getKeyCode(event: event);
    }

    public func keyReleased(event: CGEvent) {
        lastActionType = ActionType.Released;
        lastRegisteredKeyCode = getKeyCode(event: event);
    }

    public func getAction(modifier: Modifier) -> MouseAction {
        if (!hasSpaceKeyCode(keyCode: lastRegisteredKeyCode)) {
            return MouseAction.None;
        }
        if (lastActionType == ActionType.Pressed) {
            lastAction = createActionFromModifier(modifier: modifier);
            return lastAction;
        }
        return createCancelingAction();
    }

    private func getKeyCode(event: CGEvent) -> Int {
        return EventUtils.getKeyCodeFromEvent(event: event);
    }

    private func hasSpaceKeyCode(keyCode: Int) -> Bool {
        return keyCode == 49;
    }

    private func createActionFromModifier(modifier: Modifier) -> MouseAction {
        if (modifier == Modifier.None) {
            return MouseAction.LeftDown;
        }
        return MouseAction.RightDown;
    }

    private func createCancelingAction() -> MouseAction {
        if (lastAction == MouseAction.LeftDown) {
            return MouseAction.LeftUp;
        }
        if (lastAction == MouseAction.RightDown) {
            return MouseAction.RightUp;
        }
        return MouseAction.None;
    }
}
