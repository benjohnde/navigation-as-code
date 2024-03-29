// AppFlow.swift
//
// - Authors:
// Ben John
//
// - Date: 19.09.18
//
// Copyright © 2018 Ben John. All rights reserved.


import Foundation
import UIKit
import RxFlow

class AppFlow: Flow {
    var root: Presentable {
        return self.rootViewController
    }

    private let rootViewController = UINavigationController()

    func navigate(to step: Step) -> NextFlowItems {
        guard let step = step as? AppStep else { return NextFlowItems.none }
        switch step {
        case .dashboard:
            return navigateToDashboard()
        case .login:
            return navigateToLogin()
        }
    }
}

extension AppFlow {
    private func navigateToDashboard() -> NextFlowItems {
        let viewModel = DashboardViewModel()
        let viewController = DashboardViewController.instantiate(with: viewModel)
        self.rootViewController.pushViewController(viewController, animated: true)
        return NextFlowItems.one(flowItem: NextFlowItem(nextPresentable: viewController, nextStepper: viewModel))
    }
}

extension AppFlow {
    private func navigateToLogin() -> NextFlowItems {
        let viewModel = LoginViewModel()
        let viewController = LoginViewController.instantiate(with: viewModel)
        self.rootViewController.pushViewController(viewController, animated: true)
        return NextFlowItems.one(flowItem: NextFlowItem(nextPresentable: viewController, nextStepper: viewModel))
    }
}
