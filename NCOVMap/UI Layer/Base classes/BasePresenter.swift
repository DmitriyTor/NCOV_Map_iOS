//
//  BasePresenter.swift
//  NCOVMap
//
//  Created by Дмитрий Торопкин on 10.02.2020.
//  Copyright © 2020 ESKARIA. All rights reserved.
//

import UIKit

class BasePresenter {

    init() {
       
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
