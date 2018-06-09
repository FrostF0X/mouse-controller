//
// Created by Dmytro Konovalov on 5/26/18.
// Copyright (c) 2018 Frost_Fox. All rights reserved.
//

import Foundation

enum CursorMovement {
    case Top
    case Left
    case Right
    case Bottom
    case TopLeft
    case TopRight
    case BottomLeft
    case BottomRight
    case None

    private func toPoint() -> NSPoint {
        switch self {
        case CursorMovement.Top: return NSPoint(x: 0, y: 1);
        case CursorMovement.Left: return NSPoint(x: -1, y: 0);
        case CursorMovement.Right: return NSPoint(x: 1, y: 0);
        case CursorMovement.Bottom: return NSPoint(x: 0, y: -1);
        case CursorMovement.TopLeft: return NSPoint(x: -1, y: 1);
        case CursorMovement.TopRight: return NSPoint(x: 1, y: 1);
        case CursorMovement.BottomLeft: return NSPoint(x: -1, y: -1);
        case CursorMovement.BottomRight: return NSPoint(x: 1, y: -1);
        case CursorMovement.None: return NSPoint(x: 0, y: 0);
        }
    }

    private static func fromPoint(point: NSPoint) -> CursorMovement {
        switch point {
        case NSPoint(x: 0, y: 1): return CursorMovement.Top;
        case NSPoint(x: -1, y: 0): return CursorMovement.Left;
        case NSPoint(x: 1, y: 0): return CursorMovement.Right;
        case NSPoint(x: 0, y: -1): return CursorMovement.Bottom;
        case NSPoint(x: -1, y: 1): return CursorMovement.TopLeft;
        case NSPoint(x: 1, y: 1): return CursorMovement.TopRight;
        case NSPoint(x: -1, y: -1): return CursorMovement.BottomLeft;
        case NSPoint(x: 1, y: -1): return CursorMovement.BottomRight;
        default: return CursorMovement.None;
        }
    }

    public func add(_ anotherMovement: CursorMovement) -> CursorMovement {
        let resultPoint = PointUtils.normalizeAdd(point: self.toPoint(), anotherPoint: anotherMovement.toPoint());
        return CursorMovement.fromPoint(point: resultPoint);
    }

    public static func sum(_ movements: Set<CursorMovement>) -> CursorMovement {
        return movements.reduce(CursorMovement.None, { (movement, anotherMovement) -> CursorMovement in
            return movement.add(anotherMovement);
        });
    }


}
