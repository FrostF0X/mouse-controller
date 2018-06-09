//
// Created by Dmytro Konovalov on 6/9/18.
// Copyright (c) 2018 Dmytro Konovalov. All rights reserved.
//

import Foundation

class CursorCoordinatesCalculator {

    public func applyCursorMovement(cursorMovement: CursorMovement, cursorPosition: NSPoint, linearStep: CGFloat, diagonalStep: CGFloat) -> NSPoint {
        if (cursorMovement == CursorMovement.Top) {
            return NSPoint(x: cursorPosition.x, y: cursorPosition.y + linearStep);
        } else if (cursorMovement == CursorMovement.Bottom) {
            return NSPoint(x: cursorPosition.x, y: cursorPosition.y - linearStep);
        } else if (cursorMovement == CursorMovement.Left) {
            return NSPoint(x: cursorPosition.x - linearStep, y: cursorPosition.y);
        } else if (cursorMovement == CursorMovement.Right) {
            return NSPoint(x: cursorPosition.x + linearStep, y: cursorPosition.y);
        } else if (cursorMovement == CursorMovement.TopLeft) {
            return NSPoint(x: cursorPosition.x - diagonalStep, y: cursorPosition.y + diagonalStep);
        } else if (cursorMovement == CursorMovement.TopRight) {
            return NSPoint(x: cursorPosition.x + diagonalStep, y: cursorPosition.y + diagonalStep);
        } else if (cursorMovement == CursorMovement.BottomLeft) {
            return NSPoint(x: cursorPosition.x - diagonalStep, y: cursorPosition.y - diagonalStep);
        } else if (cursorMovement == CursorMovement.BottomRight) {
            return NSPoint(x: cursorPosition.x + diagonalStep, y: cursorPosition.y - diagonalStep);
        }
        return NSPoint(x: cursorPosition.x, y: cursorPosition.y);
    }

}
