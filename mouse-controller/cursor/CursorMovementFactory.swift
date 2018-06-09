//
// Created by Dmytro Konovalov on 5/31/18.
// Copyright (c) 2018 Dmytro Konovalov. All rights reserved.
//

import Foundation

class CursorMovementFactory {

    public static func createFromKeyCode(keyCode: Int) -> CursorMovement {
        switch keyCode {
        case 34: return CursorMovement.Top
        case 38: return CursorMovement.Left
        case 37: return CursorMovement.Right
        case 43: return CursorMovement.Bottom
        case 32: return CursorMovement.TopLeft
        case 31: return CursorMovement.TopRight
        case 46: return CursorMovement.BottomLeft
        case 47: return CursorMovement.BottomRight
        default: return CursorMovement.None;
        }
    }

    public static func createBasicFromKeyCode(keyCode: Int) -> CursorMovement {
        switch keyCode {
        case 34: return CursorMovement.Top
        case 38: return CursorMovement.Left
        case 37: return CursorMovement.Right
        case 40: return CursorMovement.Bottom
        default: return CursorMovement.None;
        }
    }
}
