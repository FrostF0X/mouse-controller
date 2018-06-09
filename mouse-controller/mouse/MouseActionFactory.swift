//
// Created by Dmytro Konovalov on 6/1/18.
// Copyright (c) 2018 Dmytro Konovalov. All rights reserved.
//

import Foundation

class MouseActionFactory {
    public static func create(keyCode: Int, actionType: ActionType, modifier: Modifier) -> MouseAction {
        if (keyCode != 49) {
            return MouseAction.None;
        }

        if (actionType == ActionType.Pressed) {
            if (modifier == Modifier.None) {
                return MouseAction.LeftDown
            }
            return MouseAction.RightDown;
        }

        if (modifier == Modifier.None) {
            return MouseAction.LeftUp;
        }
        return MouseAction.RightUp;
    }

}
