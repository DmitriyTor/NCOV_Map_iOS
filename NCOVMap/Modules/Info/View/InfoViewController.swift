//
//  InfoViewController.swift
//  NCOV_Map
//
//  Created by Emil Karimov on 19/02/2020.
//  Copyright © 2020 ESKARIA. All rights reserved.
//

import UIKit
import SnapKit

class InfoViewController: BaseViewController {

    var presenter: InfoPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUI()

    }

    private func createUI() {
        self.view.backgroundColor = R.color.appDark()

        let label = UILabel.makeLabel(size: 36, weight: .medium, color: .white)
        label.text = "Info"

        self.view.addSubview(label)
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }

}
extension InfoViewController: InfoViewProtocol { }
