# Landmarks

Landmarks is a SwiftUI application that provides detailed information about various landmarks. The app was developed using Combine framework for handling asynchronous data streams and follows a clean, testable architecture focusing on best practices in iOS development.

## Features

- **Explore Landmarks**: View a list of landmarks with detailed descriptions and images.
- **Modern UI**: Built with SwiftUI, providing a responsive and modern user interface.

## Architecture

- **MVVM Pattern**: Ensures a clear code and maintainability.
- **Combine Framework**: Utilized for handling asynchronous operations and data binding.
- **Dependency Injection**: Decouple components by ensuring that a class doesn't rely on the concrete implementations of its dependencies. 
- **Protocol Oriented Programming**: Allowing more flexibility for reusable components

## Unit Tests

The project includes a comprehensive suite of unit tests to ensure the reliability and correctness of the core functionality. The tests cover:
- ViewModel logic
- Data providers (both local and remote)
- Error handling scenarios

### Test Cases

The `LandmarkViewModelTests` class tests the `LandmarkViewModel` for both success and failure scenarios using a mock data provider. 

<img width="756" alt="Screenshot 2024-05-27 at 11 22 18 PM" src="https://github.com/shofiq301/Landmaks/assets/36738344/2f476db5-4a3c-40d1-a529-bd95c32c4314">

The `LandmarkDataProviderTests` class tests the `LandmarkDataProvider` class and using a mock data provider.

<img width="758" alt="Screenshot 2024-05-27 at 11 22 46 PM" src="https://github.com/shofiq301/Landmaks/assets/36738344/6d41d66d-e786-4571-a0c1-586a60ffbed3">




