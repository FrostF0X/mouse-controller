//
// Created by Dmytro Konovalov on 5/20/18.
// Copyright (c) 2018 Frost_Fox. All rights reserved.
//


import Foundation

class KeyboardEventCallbackUtility {

    public static func registerKeyEventCallback(context: UnsafeMutableRawPointer) {

        func callback(pointer: OpaquePointer, type: CGEventType, event: CGEvent, refcon: Optional<UnsafeMutableRawPointer>) -> Optional<Unmanaged<CGEvent>> {
            let controller: KeyEventHandler = refcon!.load(as: KeyEventHandler.self);
            do {
                if ([.keyDown].contains(type)) {
                    try controller.keyPressed(event: event);
                }
                if ([.keyUp].contains(type)) {
                    try controller.keyReleased(event: event)
                }
            } catch is StopPropagation {
                return Optional.none;
            } catch {
            }
            return Optional.some(Unmanaged.passUnretained(event));
        }

        let eventMask = (1 << CGEventType.keyDown.rawValue) | (1 << CGEventType.keyUp.rawValue);
        let eventTap = CGEvent.tapCreate(tap: .cgSessionEventTap,
                place: .headInsertEventTap,
                options: .defaultTap,
                eventsOfInterest: CGEventMask(eventMask),
                callback: callback,
                userInfo: context);

        let runLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, eventTap, 0);
        CFRunLoopAddSource(CFRunLoopGetCurrent(), runLoopSource, .commonModes);
        CGEvent.tapEnable(tap: eventTap!, enable: true);
        CFRunLoopRun();

    }

}


