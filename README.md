# Landmarks

Landmarks is a SwiftUI application that provides detailed information about various landmarks. The app was developed using Combine framework for handling asynchronous data streams and follows a clean, testable architecture focusing on best practices in iOS development.

## Features

- **Explore Landmarks**: View a list of landmarks with detailed descriptions and images.
- **Modern UI**: Built with SwiftUI, providing a responsive and modern user interface.

## Architecture

- **MVVM Pattern**: Ensures a clear code and maintainability.
- **Combine Framework**: Utilized for handling asynchronous operations and data binding.

## Unit Tests

The project includes a comprehensive suite of unit tests to ensure the reliability and correctness of the core functionality. The tests cover:
- ViewModel logic
- Data providers (both local and remote)
- Error handling scenarios

### Running Tests

To run the tests:
1. Open the project in Xcode.
2. Select the test target.
3. Press `Cmd + U` to run all tests.

### Example Test Cases

#### ViewModel Test Cases

The `LandmarkViewModelTests` class tests the `LandmarkViewModel` for both success and failure scenarios using a mock data provider.




