// DashboardViewModel.swift
//
// - Authors:
// Ben John
//
// - Date: 19.09.18
//
// Copyright © 2018 Ben John. All rights reserved.
    

import Foundation
import RxFlow

class DashboardViewModel: Stepper {
    func showLogin() {
        self.step.accept(AppStep.login)
    }
}
