//
// Created by Dmytro Konovalov on 5/27/18.
// Copyright (c) 2018 Frost_Fox. All rights reserved.
//

import Foundation
import Cocoa

class CursorUtils {

    public static func getCursorPosition() -> NSPoint {
        return NSEvent.mouseLocation();
    }

    public static func convertToQuartzCoordinates(position: NSPoint) -> NSPoint {
        return NSPoint(x: position.x, y: NSHeight(NSScreen.screens()![0].frame) - position.y);
    }

    public static func getQuartzCursorPosition() -> NSPoint {
        return convertToQuartzCoordinates(position: getCursorPosition());
    }
}
