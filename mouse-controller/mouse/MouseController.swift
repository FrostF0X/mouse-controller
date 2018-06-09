//
// Created by Dmytro Konovalov on 6/1/18.
// Copyright (c) 2018 Dmytro Konovalov. All rights reserved.
//

import Foundation

class MouseController {

    public func performAction(action: MouseAction) {
        if (action == MouseAction.LeftDown) {
            MouseEventManager.leftMouseDown();
        }
        if (action == MouseAction.LeftUp) {
            MouseEventManager.leftMouseUp();
        }
        if (action == MouseAction.RightDown) {
            MouseEventManager.rightMouseDown();
        }
        if (action == MouseAction.RightUp) {
            MouseEventManager.rightMouseUp();
        }
    }

}
