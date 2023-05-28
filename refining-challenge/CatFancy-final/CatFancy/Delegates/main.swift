// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.
// Shared by Jon Reid in 2016.

import UIKit

let appDelegateClass: AnyClass = NSClassFromString("TestingAppDelegate") ?? AppDelegate.self

UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, NSStringFromClass(appDelegateClass))
