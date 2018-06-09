//
// Created by Dmytro Konovalov on 6/3/18.
// Copyright (c) 2018 Dmytro Konovalov. All rights reserved.
//

import Foundation

class MouseEventManager {

    public static func moveMouseToPosition(position: CGPoint) {
        EventUtils.postEvent(event: createMoveEvent(position: position));
    }

    public static func leftMouseDown() {
        let cursorPosition = CursorUtils.getQuartzCursorPosition();
        EventUtils.postEvent(event: createLeftMouseDownInPosition(position: cursorPosition));
    }

    public static func leftMouseUp() {
        let cursorPosition = CursorUtils.getQuartzCursorPosition();
        EventUtils.postEvent(event: createLeftMouseUpInPosition(position: cursorPosition));
    }

    public static func rightMouseDown() {
        let cursorPosition = CursorUtils.getQuartzCursorPosition();
        EventUtils.postEvent(event: createRightMouseDownInPosition(position: cursorPosition));
    }

    public static func rightMouseUp() {
        let cursorPosition = CursorUtils.getQuartzCursorPosition();
        EventUtils.postEvent(event: createRightMouseUpInPosition(position: cursorPosition));
    }

    private static func createLeftMouseDownInPosition(position: NSPoint) -> CGEvent? {
        return CGEvent(mouseEventSource: CGEventSource(stateID: .hidSystemState), mouseType: .leftMouseDown, mouseCursorPosition: position, mouseButton: .left)!;
    }

    private static func createLeftMouseUpInPosition(position: NSPoint) -> CGEvent? {
        return CGEvent(mouseEventSource: CGEventSource(stateID: .hidSystemState), mouseType: .leftMouseUp, mouseCursorPosition: position, mouseButton: .left)!;
    }

    private static func createRightMouseDownInPosition(position: NSPoint) -> CGEvent? {
        return CGEvent(mouseEventSource: CGEventSource(stateID: .hidSystemState), mouseType: .rightMouseDown, mouseCursorPosition: position, mouseButton: .right)!;
    }

    private static func createRightMouseUpInPosition(position: NSPoint) -> CGEvent? {
        return CGEvent(mouseEventSource: CGEventSource(stateID: .hidSystemState), mouseType: .rightMouseUp, mouseCursorPosition: position, mouseButton: .right)!;
    }

    private static func createMoveEvent(position: CGPoint) -> CGEvent? {
        return CGEvent(mouseEventSource: CGEventSource(stateID: .hidSystemState), mouseType: .mouseMoved, mouseCursorPosition: position, mouseButton: .left)!;
    }

}
