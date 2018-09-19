// AppStep.swift
//
// - Authors:
// Ben John
//
// - Date: 19.09.18
//
// Copyright © 2018 Ben John. All rights reserved.
    

import Foundation
import RxFlow

enum AppStep: Step {
    case launch

    case login
    case logout

    case dashboard
}
