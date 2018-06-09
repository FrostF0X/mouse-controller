//
// Created by Dmytro Konovalov on 5/31/18.
// Copyright (c) 2018 Dmytro Konovalov. All rights reserved.
//

import Foundation

protocol MouseControllingStarter {
    func keyPressed(event: CGEvent) -> Void;
    func keyReleased(event: CGEvent) -> Void;
    func checkIfLastEventShouldStartControlling() -> Bool;
    func checkIfLastEventShouldStopControlling() -> Bool;
}
