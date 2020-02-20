//
//  DonateProtocols.swift
//  NCOV_Map
//
//  Created by Emil Karimov on 18/02/2020.
//  Copyright © 2020 ESKARIA. All rights reserved.
//

import UIKit
import DTPurchase

// PRESENTER -> VIEW
protocol DonateViewProtocol: class {
    func showSuccess()
    func showOkAlert(with title: String, description: String?)
    func showLoading()
    func hideLoading()
}

// PRESENTER -> WIREFRAME
protocol DonateWireFrameProtocol: class { }

// VIEW -> PRESENTER
protocol DonatePresenterProtocol: class {
    func didClickDonate(value: DonatePrice)
    func viewLoaded()
}

// PRESENTER -> INTERACTOR
protocol DonateInteractorProtocol: class {
    func getProducts(completion: @escaping ([DTIAPProduct]) -> Void)
    func purchase(product: DTIAPProduct, completion: @escaping (DTPurchaseStatus) -> Void)
}
