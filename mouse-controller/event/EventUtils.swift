//
// Created by Dmytro Konovalov on 5/27/18.
// Copyright (c) 2018 Frost_Fox. All rights reserved.
//

import Foundation

class EventUtils {

    public static func getKeyCodeFromEvent(event: CGEvent) -> Int {
        return Int(event.getIntegerValueField(.keyboardEventKeycode));
    }

    public static func checkEventHasKey(event: CGEvent, key: Key) -> Bool {
        return key.hasCode(keyCode: getKeyCodeFromEvent(event: event));
    }

    public static func postEvent(event: CGEvent?) {
        event?.post(tap: .cghidEventTap)
    }

}