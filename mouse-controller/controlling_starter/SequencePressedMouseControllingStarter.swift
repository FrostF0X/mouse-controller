//
// Created by Dmytro Konovalov on 5/31/18.
// Copyright (c) 2018 Dmytro Konovalov. All rights reserved.
//

import Foundation

class SequencePressedMouseControllingStarter: MouseControllingStarter {

    var started = true;
    var activated = false;

    public func keyPressed(event: CGEvent) {
        activated = false;
        if (eventSatisfiesMask(event: event)) {
            started = !started;
            activated = true;
        }
    }

    public func keyReleased(event: CGEvent) {
    }

    public func checkIfLastEventShouldStartControlling() -> Bool {
        return !started && activated;
    }

    public func checkIfLastEventShouldStopControlling() -> Bool {
        return started && activated;
    }

    public func eventSatisfiesMask(event: CGEvent) -> Bool {
        return EventUtils.checkEventHasKey(event: event, key: Key.CapsLock) && event.flags.contains(CGEventFlags.maskShift);
    }
}
