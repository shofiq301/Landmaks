//
//  LandmarkService.swift
//  Landmaks
//
//  Created by Md Shofiulla on 27/5/24.
//

import Foundation
import Combine
protocol LandmakProtocol {
    func getLandmarks() -> AnyPublisher<[LandMarkModel], Error>
}
