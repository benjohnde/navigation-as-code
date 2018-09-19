// LoginViewController.swift
//
// - Authors:
// Ben John
//
// - Date: 19.09.18
//
// Copyright © 2018 Ben John. All rights reserved.


import UIKit

class LoginViewController: UIViewController {
    var viewModel: LoginViewModel!
}

extension LoginViewController {
    class func instantiate(with viewModel: LoginViewModel) -> LoginViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "Login") as? LoginViewController else {
            fatalError()
        }
        viewController.viewModel = viewModel
        return viewController
    }
}
