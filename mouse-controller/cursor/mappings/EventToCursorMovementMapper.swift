//
// Created by Dmytro Konovalov on 5/31/18.
// Copyright (c) 2018 Dmytro Konovalov. All rights reserved.
//

import Foundation

protocol EventToCursorMovementMapper {
    func keyPressed(event: CGEvent);
    func keyReleased(event: CGEvent);
    func getMovement() -> CursorMovement;
    func shouldStopPropagation() -> Bool;
}
