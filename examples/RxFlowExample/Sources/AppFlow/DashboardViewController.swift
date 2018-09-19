// DashboardViewController.swift
//
// - Authors:
// Ben John
//
// - Date: 19.09.18
//
// Copyright © 2018 Ben John. All rights reserved.
    

import UIKit

class DashboardViewController: UIViewController {
    var viewModel: DashboardViewModel!

    @IBAction func loginButtonTouched(_ sender: Any) {
        self.viewModel.showLogin()
    }
}

extension DashboardViewController {
    class func instantiate(with viewModel: DashboardViewModel) -> DashboardViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "Dashboard") as? DashboardViewController else {
            fatalError()
        }
        viewController.viewModel = viewModel
        return viewController
    }
}
