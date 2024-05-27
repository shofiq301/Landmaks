//
//  LandmarkDataProviderTests.swift
//  LandmaksTests
//
//  Created by Md Shofiulla on 27/5/24.
//

import XCTest
import Combine
@testable import Landmaks

final class LandmarkDataProviderTests: XCTestCase {
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        cancellables = []
    }
    
    override func tearDown() {
        cancellables = nil
        super.tearDown()
    }
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetLandmarksSuccess() {
        let provider = LocalLandmarkDataProvider()
        
        let expectation = self.expectation(description: "Landmarks fetched successfully")
        
        // Subscribe to the publisher and assert the results
        provider.getLandmarks()
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    XCTFail("Expected success but got error: \(error)")
                }
            }, receiveValue: { landmarks in
                XCTAssertEqual(landmarks.count, 12)
                XCTAssertEqual(landmarks[0].name, "Turtle Rock")
                XCTAssertEqual(landmarks[1].name, "Silver Salmon Creek")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        // Wait for expectations
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testGetLandmarksFailure() {
        
        let provider = MockLocalLandmarkDataProvider()
        
        let expectation = self.expectation(description: "Landmarks fetch failed")
        
        // Subscribe to the publisher and assert the results
        provider.getLandmarks()
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    XCTAssertNotNil(error)
                    expectation.fulfill()
                }
            }, receiveValue: { landmarks in
                XCTFail("Expected failure but got success with \(landmarks.count) landmarks")
            })
            .store(in: &cancellables)
        
        // Wait for expectations
        waitForExpectations(timeout: 1, handler: nil)
    }
}
class MockLocalLandmarkDataProvider: LocalLandmarkDataProvider {
    override func loadLocalLandmarks() -> [LandmarkModel]? {
        return nil
    }
}
