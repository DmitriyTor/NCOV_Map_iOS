//
//  BaseViewController.swift
//  NCOVMap
//
//  Created by Дмитрий Торопкин on 10.02.2020.
//  Copyright © 2020 ESKARIA. All rights reserved.
//

import UIKit
import KRProgressHUD

enum LoadingResult {
    case success
    case none
    case error
    case warning
    case info
}

class BaseViewController: UIViewController {
    
    var themeManager: ThemeManager
    private var currentMode: UIUserInterfaceStyle!
    
    public let lbl_title: UILabel = UILabel.makeLabel(size: 22, weight: .bold, color: .white)
    
    init(themeManager: ThemeManager) {
        self.themeManager = themeManager
        super.init(nibName: nil, bundle: nil)
        
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
  
        self.currentMode = self.traitCollection.userInterfaceStyle
        guard let previousMode = previousTraitCollection?.userInterfaceStyle else { return }
        
        if previousMode == .light, previousMode != currentMode {
            self.userActivatedDarkMode()
            self.currentMode = .light
        } else if previousMode == .dark, previousMode != currentMode {
            self.userActivateLightMode()
            self.currentMode = .dark
        }
    }
    
    open func userActivateLightMode(execute: (() -> Void)? = nil ) {
        self.themeManager.setLight()
        self.animateChangeMode(execute: execute)
    }
    
    open func userActivatedDarkMode(execute: (() -> Void)? = nil ) {
        self.themeManager.setDark()
        self.animateChangeMode(execute: execute)
    }
    
    public func showBaseOkAlertController(title: String?, message: String?, callback: (() -> Void)? = nil) {
        self.showBaseAlertController(style: .alert) {
            $0.title = title
            $0.message = message
            let action = UIAlertAction(title: "OK", style: .cancel, handler: { (_) in
                if callback != nil {
                    callback!()
                }
            })
            $0.addAction(action)
        }
    }
    
    func showBaseAlertController(style: UIAlertController.Style, setupBlock: (UIAlertController) -> Void) {

        let alertController: UIAlertController = UIAlertController(title: "Ошибка", message: nil, preferredStyle: style)
        setupBlock(alertController)

        if alertController.actions.count < 1 {
            fatalError("No actions provided in alert controller")
        }

        self.present(alertController, animated: true, completion: nil)
    }
    
    /// на некоторых экранах (например на карте) происходит жесткое моргание при подгрузке новой темы, так что лучше затемнять экран
    /// - Parameter execute: что выполнить в момент темного экрана
    private func animateChangeMode(execute: (() -> Void)? = nil ) {
        let window = UIApplication.shared.windows.filter{$0.isKeyWindow}.first
        guard let _mainView = window else { return }
        let _view = UIView()
        _view.alpha = 0
        _view.backgroundColor = .black
        _mainView.addSubview(_view)
        _view.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        UIView.animate(withDuration: 0.5, animations: {
            _view.alpha = 1
        }) { (_) in
            execute?()
            UIView.animate(withDuration: 0.5, animations: {
                _view.alpha = 0
            }) { _ in
                _view.removeFromSuperview()
            }
        }
    }
    
    func showBaseLoading(with message: String?, completion: (() -> Void)? = nil) {
        KRProgressHUD.show(withMessage: message, completion: completion)
    }
    
    func hideBaseLoading(with result: LoadingResult = .none, message: String? = nil) {
        switch result {
        case .success:
            KRProgressHUD.showSuccess(withMessage: message)
        case .none:
            KRProgressHUD.dismiss()
        case .error:
            KRProgressHUD.showError(withMessage: message)
        case .warning:
            KRProgressHUD.showWarning(withMessage: message)
        case .info:
            KRProgressHUD.showInfo(withMessage: message)
        }
    }
    
    func customNavigationTitle(title: String) {
        
        self.view.addSubview(lbl_title)
        lbl_title.numberOfLines = 0
        lbl_title.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(24)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-16)
        }

        lbl_title.text = title
    }
}


extension Swift.Optional where Wrapped == UIColor {
    
    func unwrapped() -> UIColor {
        if let color = self {
            return color
        } else {
            return .clear
        }
    }
}
