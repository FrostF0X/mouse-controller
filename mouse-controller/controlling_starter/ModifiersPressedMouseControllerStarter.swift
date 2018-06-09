//
// Created by Dmytro Konovalov on 5/31/18.
// Copyright (c) 2018 Dmytro Konovalov. All rights reserved.
//

import Foundation

class ModifiersPressedMouseControllingStarter: MouseControllingStarter {

    private var start: Bool = false;
    private var stop: Bool = false;

    public func keyPressed(event: CGEvent) {
        resetState();
        if(eventSatisfiesMask(event: event)){
            start = true;
        }
    }

    public func keyReleased(event: CGEvent) {
        resetState();
        if(eventSatisfiesMask(event: event)){
            stop = true;
        }
    }

    public func checkIfLastEventShouldStartControlling() -> Bool {
        return start;
    }

    public func checkIfLastEventShouldStopControlling() -> Bool {
        return stop;
    }

    public func eventSatisfiesMask(event: CGEvent) -> Bool {
        return event.flags.contains([CGEventFlags.maskCommand, CGEventFlags.maskShift, CGEventFlags.maskControl]);
    }

    public func resetState(){
        stop = false;
        start = false;
    }
}
