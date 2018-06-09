//
// Created by Dmytro Konovalov on 6/3/18.
// Copyright (c) 2018 Dmytro Konovalov. All rights reserved.
//

import Foundation

class ModifierMapper {

    private var modifier: Modifier = Modifier.None;

    func keyPressed(event: CGEvent) {
        if eventWithFn(event: event) {
            self.modifier = Modifier.Active;
        } else {
            self.modifier = Modifier.None;
        }
    }

    func keyReleased(event: CGEvent) {
    }

    private func eventWithFn(event: CGEvent) -> Bool {
        return event.flags.contains(CGEventFlags.maskShift)
    }

    func getModifier() -> Modifier {
        return self.modifier;
    }
}
