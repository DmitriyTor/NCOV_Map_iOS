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
    
    private var tableView = UITableView()
    private var dataSource = InfoDataSource()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUI()

    }

    private func createUI() {

        self.view.backgroundColor = R.color.appDark()
        self.navigationController?.setNavigationBarHidden(true, animated: false)

        self.customNavigationTitle(title: R.string.localizable.info_title())
        
        self.tableView.register(InfoTableCell.self, forCellReuseIdentifier: InfoTableCell.identifier)

        self.tableView.delegate = self
        self.tableView.dataSource = self

        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        self.tableView.separatorStyle = .none
        self.tableView.tableFooterView = UIView()
        
    }

}
extension InfoViewController: InfoViewProtocol { }

// MARK: - UITableViewDataSource, UITableViewDelegate
extension InfoViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.numberOfRows(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.dataSource.tableView(tableView, cellForRowAt: indexPath)
    }
}
