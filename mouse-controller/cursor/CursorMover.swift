//
// Created by Dmytro Konovalov on 5/27/18.
// Copyright (c) 2018 Frost_Fox. All rights reserved.
//

import Foundation

class CursorMover {

    private var linearStep: CGFloat;
    private var diagonalStep: CGFloat;
    private let coordinatesCalculator: CursorCoordinatesCalculator;

    init(linearStep: CGFloat, diagonalStep: CGFloat) {
        self.linearStep = linearStep;
        self.diagonalStep = diagonalStep;
        coordinatesCalculator = CursorCoordinatesCalculator();
    }

    public func moveCursor(cursorMovement: CursorMovement) {
        moveCursorByStep(cursorMovement: cursorMovement, linearStep: getLinearStep(doubled: false), diagonalStep: getDiagonalStep(doubled: false))
    }

    public func moveCursorWithDoubledModifier(cursorMovement: CursorMovement) {
        moveCursorByStep(cursorMovement: cursorMovement, linearStep: getLinearStep(doubled: true), diagonalStep: getDiagonalStep(doubled: true));
    }

    private func moveCursorByStep(cursorMovement: CursorMovement, linearStep: CGFloat, diagonalStep: CGFloat) {
        let cursorPosition = CursorUtils.getCursorPosition();
        let movedCursorPosition = coordinatesCalculator.applyCursorMovement(cursorMovement: cursorMovement, cursorPosition: cursorPosition, linearStep: linearStep, diagonalStep: diagonalStep);
        moveCursorToNewPosition(position: movedCursorPosition);
    }

    private func moveCursorToNewPosition(position: NSPoint) {
        let quartzPosition = CursorUtils.convertToQuartzCoordinates(position: position);
        MouseEventManager.moveMouseToPosition(position: quartzPosition);
    }

    private func getLinearStep(doubled: Bool) -> CGFloat {
        if (doubled) {
            return linearStep * 2;
        }
        return linearStep;
    }

    private func getDiagonalStep(doubled: Bool) -> CGFloat {
        if (doubled) {
            return diagonalStep * 2;
        }
        return diagonalStep;
    }

}