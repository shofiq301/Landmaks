//
//  LandMarViewModel.swift
//  Landmaks
//
//  Created by Md Shofiulla on 27/5/24.
//

import Foundation
import Combine
final class LandmarkViewModel: ObservableObject {
    let landmarservice: LandmarkDataProvider
    @Published var landmarks: [LandmarkModel] = []
    var cancellable = Set<AnyCancellable>()
    
    init(landmarservice: LandmarkDataProvider) {
        self.landmarservice = landmarservice
        getLandmarData()
    }
    
    func getLandmarData(){
        landmarservice.getLandmarks()
            .sink { completion in
                switch completion{
                case .finished:
                    debugPrint("Received data sucessfully")
                case .failure(let error):
                    debugPrint(error)
                }
            } receiveValue: {[weak self] updatedLandmarks in
                self?.landmarks = updatedLandmarks
            }.store(in: &cancellable)

    }
    
}
