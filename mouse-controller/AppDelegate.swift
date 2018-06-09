//
//  AppDelegate.swift
//  mouse_cursor2
//
//  Created by Dmytro Konovalov on 5/31/18.
//  Copyright © 2018 Dmytro Konovalov. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength);
    var controller = KeyEventHandler();

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem.image = NSImage(named: "Image");
        statusItem.menu = createMenu();
        KeyboardEventCallbackUtility.registerKeyEventCallback(context: createControllerPointer());
    }

    private func createControllerPointer() -> UnsafeMutableRawPointer {
        return UnsafeMutableRawPointer(&controller)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
    }

    func createMenu() -> NSMenu{
        let menu = NSMenu();
        let quit = NSMenuItem(title: "Quit", action: #selector(self.quit), keyEquivalent: "");
        quit.target = self;
        menu.addItem(quit);
        return menu;
    }

    @objc private func quit(){
        NSApplication.shared().terminate(self);
    }
}

