//
// Created by Dmytro Konovalov on 5/27/18.
// Copyright (c) 2018 Frost_Fox. All rights reserved.
//

import Foundation
import Cocoa

class CursorController {

    private let linearStepBasis: CGFloat = 2;
    private let diagonalStepBasis: CGFloat = 1.41;
    private let stepMultiplier: CGFloat = 3;

    private let cursorMover: CursorMover;
    private var currentCursorMovement: CursorMovement = CursorMovement.None;
    private var currentModifierState: Modifier = Modifier.None;

    init() {
        self.cursorMover = CursorMover(linearStep: linearStepBasis * stepMultiplier, diagonalStep: diagonalStepBasis * stepMultiplier);
        startEventLoop();
    }

    public func setMovement(cursorMovement: CursorMovement) {
        self.currentCursorMovement = cursorMovement;
    }

    public func setModifier(modifier: Modifier) {
        self.currentModifierState = modifier;
    }

    private func startEventLoop() {
        Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(self.moveCursor), userInfo: nil, repeats: true);
        Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.moveCursorTwiceFaster), userInfo: nil, repeats: true);
    }


    @objc private func moveCursorTwiceFaster() {
        if (currentCursorMovement != CursorMovement.None && currentModifierState == Modifier.Active) {
            cursorMover.moveCursorWithDoubledModifier(cursorMovement: currentCursorMovement);
        }
    }

    @objc private func moveCursor() {
        if (currentCursorMovement != CursorMovement.None && currentModifierState == Modifier.None) {
            cursorMover.moveCursor(cursorMovement: currentCursorMovement);
        }
    }
}
