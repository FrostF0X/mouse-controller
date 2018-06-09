//
// Created by Dmytro Konovalov on 6/6/18.
// Copyright (c) 2018 Dmytro Konovalov. All rights reserved.
//

import Foundation

enum Key: Int {
    case CapsLock = 53;

    public func hasCode(keyCode: Int) -> Bool {
        return self.rawValue == keyCode;
    }
}