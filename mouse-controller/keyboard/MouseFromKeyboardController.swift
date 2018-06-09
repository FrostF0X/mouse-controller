//
// Created by Dmytro Konovalov on 6/6/18.
// Copyright (c) 2018 Dmytro Konovalov. All rights reserved.
//

import Foundation

class MouseFromKeyboardController {

    var cursorController: CursorController;
    var mouseController: MouseController;
    var movementMapper: EventToCursorMovementMapper;
    var modifierMapper: ModifierMapper;
    var actionMapper: MouseActionMapper;
    var started: Bool = false;

    init() {
        self.cursorController = CursorController();
        self.movementMapper = FourButtonsEventToCursorMovementMapper();
        self.mouseController = MouseController();
        self.actionMapper = MouseActionMapper();
        self.modifierMapper = ModifierMapper();
    }

    public func isStarted() -> Bool {
        return started;
    }

    public func start() {
        started = true;
    }

    public func stop() {
        started = false;
    }

    public func keyPressed(event: CGEvent) throws {
        notifyPressedListeners(event: event);
        try performMovementAndAction();
    }

    public func keyReleased(event: CGEvent) throws {
        notifyReleasedListeners(event: event);
        try performMovementAndAction();
    }


    private func notifyPressedListeners(event: CGEvent) {
        movementMapper.keyPressed(event: event);
        actionMapper.keyPressed(event: event);
        modifierMapper.keyPressed(event: event);
    }

    private func notifyReleasedListeners(event: CGEvent) {
        movementMapper.keyReleased(event: event);
        actionMapper.keyReleased(event: event);
        modifierMapper.keyReleased(event: event);
    }


    private func performMovementAndAction() throws {
        let modifier = modifierMapper.getModifier();
        let cursorMovement = movementMapper.getMovement();
        cursorController.setMovement(cursorMovement: cursorMovement);
        cursorController.setModifier(modifier: modifier);
        let mouseAction = actionMapper.getAction(modifier: modifier);
        mouseController.performAction(action: mouseAction);

        if (mouseAction != MouseAction.None || movementMapper.shouldStopPropagation()) {
            throw StopPropagation();
        }
    }
}
