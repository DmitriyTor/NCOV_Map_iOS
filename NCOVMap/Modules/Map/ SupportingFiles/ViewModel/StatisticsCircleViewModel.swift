//
//  StatisticsCircleViewModel.swift
//  NCOVMap
//
//  Created by Дмитрий Торопкин on 11.02.2020.
//  Copyright © 2020 ESKARIA LLC. All rights reserved.
//

import Foundation

class StatisticsCircleViewModel {
    
    let longitude: Double
    let latitude: Double
    let radius: Double
    let alpha: Double
    
    init(longitude: Double, latitude: Double, radius: Double, alpha: Double) {
        self.longitude = longitude
        self.latitude = latitude
        self.radius = radius
        self.alpha = alpha
    }
}
