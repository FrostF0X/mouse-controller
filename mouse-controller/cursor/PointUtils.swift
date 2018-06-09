//
// Created by Dmytro Konovalov on 5/31/18.
// Copyright (c) 2018 Dmytro Konovalov. All rights reserved.
//

import Foundation

class PointUtils {
    public static func add(point: NSPoint, anotherPoint: NSPoint) -> NSPoint {
        return NSPoint(x: point.x + anotherPoint.x, y: point.y + anotherPoint.y);
    }

    public static func normalize(point: NSPoint) -> NSPoint {
        return NSPoint(x: normalizeNumber(number: point.x), y: normalizeNumber(number: point.y));
    }

    public static func normalizeAdd(point: NSPoint, anotherPoint: NSPoint) -> NSPoint {
        return self.normalize(point: self.add(point: point, anotherPoint: anotherPoint));
    }

    public static func normalizeNumber(number: CGFloat) -> CGFloat {
        if (number > 0) {
            return 1;
        }
        if (number < 0) {
            return -1;
        }
        return 0;
    }

}
