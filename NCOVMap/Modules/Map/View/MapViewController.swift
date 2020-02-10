//
//  MapViewController.swift
//  NCOV_Map
//
//  Created by Dmitriy on 10/02/2020.
//  Copyright © 2020 ESKARIA. All rights reserved.
//

import UIKit
import SnapKit
import GoogleMaps
import GooglePlaces

class MapViewController: BaseViewController {

    var presenter: MapPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUI()

    }

    private func createUI() {

        self.view.backgroundColor = .white
        self.title = "Map"
        
        let mapContainer = UIView()
        let camera = GMSCameraPosition(latitude: 0, longitude: 0, zoom: 1)
        let mapView = GMSMapView(frame: mapContainer.frame, camera: camera)
        mapContainer.addSubview(mapView)
        
        self.view.addSubview(mapContainer)
        mapContainer.snp.makeConstraints { (make) in
            make.height.width.equalTo(100)
            make.center.equalToSuperview()
        }
    }

}
extension MapViewController: MapViewProtocol { }
