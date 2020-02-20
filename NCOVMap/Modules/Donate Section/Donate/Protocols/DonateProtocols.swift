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
    func insert(products: [DTIAPProduct])
}

// PRESENTER -> WIREFRAME
protocol DonateWireFrameProtocol: class { }

// VIEW -> PRESENTER
protocol DonatePresenterProtocol: class {
    func didClickDonate(product: DTIAPProduct)
    func viewLoaded()
}

// PRESENTER -> INTERACTOR
protocol DonateInteractorProtocol: class {
    func getProducts(completion: @escaping ([DTIAPProduct]) -> Void)
    func purchase(product: DTIAPProduct, completion: @escaping (DTPurchaseStatus) -> Void)
}
