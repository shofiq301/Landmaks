//
//  LandmarkViewModelTests.swift
//  LandmaksTests
//
//  Created by Md Shofiulla on 27/5/24.
//

import XCTest
import Combine
@testable import Landmaks

final class LandmarkViewModelTests: XCTestCase {
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
    
    func testGetLandmarDataSuccess() {
        // Given
        let landmarks = [
            LandmarkModel(id: 1, name: "Landmark 1", subtitle: "Test subtitle 1", imageName: "testimage_1"),
            LandmarkModel(id: 2, name: "Landmark 2", subtitle: "Test subtitle_2", imageName: "testimage_2")
        ]
        let mockProvider = MockLandmarkDataProvider(result: .success(landmarks))
        let viewModel = LandmarkViewModel(landmarservice: mockProvider)
        
        let expectation = self.expectation(description: "Landmarks fetched successfully")
        
        // When
        viewModel.$landmarks
            .sink { landmarks in
                // Then
                XCTAssertEqual(landmarks.count, 2)
                XCTAssertEqual(landmarks[0].name, "Landmark 1")
                XCTAssertEqual(landmarks[1].name, "Landmark 2")
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        // Wait for expectations
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testGetLandmarDataFailure() {
        // Given
        let mockProvider = MockLandmarkDataProvider(result: .failure(URLError(.badServerResponse)))
        let viewModel = LandmarkViewModel(landmarservice: mockProvider)
        
        // Expectation for async test
        let expectation = self.expectation(description: "Landmarks fetch failed")
        
        // When
        viewModel.$landmarks
            .sink { landmarks in
                // Then
                XCTAssertTrue(landmarks.isEmpty)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        // Wait for expectations
        waitForExpectations(timeout: 5, handler: nil)
    }
    
}
// Mock LandmarkDataProvider
class MockLandmarkDataProvider: LandmarkDataProvider {
    var result: Result<[LandmarkModel], Error>
    
    init(result: Result<[LandmarkModel], Error>) {
        self.result = result
    }
    
    func getLandmarks() -> AnyPublisher<[LandmarkModel], Error> {
        return result
            .publisher
            .eraseToAnyPublisher()
    }
}
