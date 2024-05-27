//
//  LandmarkService.swift
//  Landmaks
//
//  Created by Md Shofiulla on 27/5/24.
//

import Foundation
import Combine
final class RemoteLandmarkDataProvider: LandmarkDataProvider {
    
    let url: URL?
    init(url: URL?) {
        self.url = url
    }
    func getLandmarks() -> AnyPublisher<[LandmarkModel], Error> {
        
        guard let url = url else { return Fail(error: URLError(.badURL)).eraseToAnyPublisher()}
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [LandmarkModel].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func handleOutput(_ output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              (200...299).contains(response.statusCode) else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}

class LocalLandmarkDataProvider: LandmarkDataProvider {
    enum MyError: Error {
        case localDataError
    }
    func getLandmarks() -> AnyPublisher<[LandmarkModel], Error> {
        guard let localData = loadLocalLandmarks() else {
            guard let localData = loadLocalLandmarks() else {
                return Fail(error: MyError.localDataError).eraseToAnyPublisher()
            }
            return Just(localData).setFailureType(to: Error.self).eraseToAnyPublisher()
        }
        return Just(localData).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
    
    func loadLocalLandmarks() -> [LandmarkModel]? {
      guard let filePath = Bundle.main.path(forResource: "landmarkData", ofType: "json") else {
        return nil
      }

      do {
        let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
        let decoder = JSONDecoder()
        return try decoder.decode([LandmarkModel].self, from: data)
      } catch {
        print("Error loading local landmarks: \(error)")
        return nil
      }
    }
}
