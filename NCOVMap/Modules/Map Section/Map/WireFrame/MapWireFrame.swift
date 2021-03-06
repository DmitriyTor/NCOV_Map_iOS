//
//  MapWireFrame.swift
//  NCOV_Map
//
//  Created by Dmitriy on 10/02/2020.
//  Copyright © 2020 ESKARIA. All rights reserved.
//

import UIKit
import SPStorkController

class MapWireFrame: BaseWireFrame { }

extension MapWireFrame: MapWireFrameProtocol {

    func presentDescriptionViewController(from view: MapViewProtocol?, type: DescriptionCase, model: StatisticsModel) {
        guard let fromView = view as? UIViewController else { return }
        let controller = self.resolver.presentDescriptionViewController(type: type, model: model)
        fromView.presentAsStork(controller)
    }
}
