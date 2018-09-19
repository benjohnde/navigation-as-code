// AppDelegate.swift
//
// - Authors:
// Ben John
//
// - Date: 19.09.18
//
// Copyright © 2018 Ben John. All rights reserved.

import RxFlow
import RxSwift
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK: - Cocoa
    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    // MARK: - RxFlow
    let disposeBag = DisposeBag()
    let coordinator = Coordinator()
    let appFlow = AppFlow()

    // MARK: - Application init
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        guard let window = window else { return false }
        window.makeKeyAndVisible()

        // 1. subscribe to global navigation state changes
        coordinator.rx.didNavigate.subscribe(onNext: { (flow, step) in
            print("did navigate to flow=\(flow) and step=\(step)")
        }).disposed(by: self.disposeBag)

        // 2. wait for the Flow (i.e. init before binding)
        Flows.whenReady(flow1: appFlow, block: { [unowned window] (flowRoot) in
            window.rootViewController = flowRoot
        })

        // 3. point to the entry step
        coordinator.coordinate(flow: appFlow, withStepper: OneStepper(withSingleStep: AppStep.dashboard))

        return true
    }
}
