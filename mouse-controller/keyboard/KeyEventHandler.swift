
import Foundation

class KeyEventHandler {

    var mouseControllingStarter: MouseControllingStarter;
    var mouseController: MouseFromKeyboardController;
    init() {
        self.mouseControllingStarter = SequencePressedMouseControllingStarter();
        self.mouseController = MouseFromKeyboardController();
    }

    public func tryToStart() {
        if(!mouseController.isStarted() && mouseControllingStarter.checkIfLastEventShouldStartControlling()){
            print("started");
            mouseController.start();
        }
    }

    public func tryToStop() {
        if(mouseController.isStarted() && mouseControllingStarter.checkIfLastEventShouldStopControlling()){
            print("stopped");
            mouseController.stop();
        }
    }

    public func keyPressed(event: CGEvent) throws {
        mouseControllingStarter.keyReleased(event: event);

        tryToStart();
        tryToStop();

        if(mouseController.isStarted()){
            try mouseController.keyPressed(event: event);
        }
    }

    public func keyReleased(event: CGEvent) throws {
        mouseControllingStarter.keyPressed(event: event);

        tryToStart();
        tryToStop();

        if(mouseController.isStarted()){
            try mouseController.keyReleased(event: event);
        }
    }

}
