//
//  MapInteractor.swift
//  NCOV_Map
//
//  Created by Dmitriy on 10/02/2020.
//  Copyright © 2020 ESKARIA. All rights reserved.
//

import EKNetworking

class MapInteractor: BaseInteractor {
    
    private var networking: NetworkRequestProvider
    
    init(networking: NetworkRequestProvider) {
        self.networking = networking
    }
}

extension MapInteractor: MapInteractorProtocol {
    
    func getStatistics(completion: @escaping (StatisticsModel?, EKNetworkError?) -> Void) {
        self.networking.getStatistics(completion)
    }
    
    func getLocation(completion: @escaping (IPPlaceJSONModel?, EKNetworkError?) -> Void) {
        self.networking.getLocation(completion)
    }
}
