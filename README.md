<<<<<<< HEAD
# bookly_clean_arch

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
=======
# 📚 Bookly App

Bookly is a sophisticated book browsing application built with **Flutter**, designed to provide users with a seamless and visually appealing experience when discovering free books. This project demonstrates advanced Flutter development practices, focusing on **Clean Architecture**, **MVVM pattern**, and **Premium UI Design**.

<p align="center">
  <img src="assets/images/bookly_logo.jpg" alt="Bookly Logo" width="150"/>
</p>

## 🚀 Project Overview

The application fetches book data from the Google Books API, allowing users to:
- Browse **Featured** and **Newest** books.
- **Search** for specific books with optimized queries.
- View detailed book information and **Similar Book** recommendations.
- Experience a smooth, lag-free UI with proper error handling and shimmer loading effects.

## ✨ Key Features

- **Clean Architecture**  
  Clear separation of concerns into **Data**, **Domain**, and **Presentation** layers, ensuring scalability, maintainability, and testability.

- **Bloc & Cubit State Management**  
  Predictable and well-organized state management following clean architecture principles.

- **Responsive UI**  
  Adaptive layouts that provide a consistent and smooth experience across different screen sizes and devices.

- **Interactive Search**  
  Optimized search functionality with input validation and debouncing to reduce unnecessary API calls.

- **Dark Mode**  
  Modern and elegant dark theme built using a custom color palette.

- **Robust Error Handling**  
  Functional error handling using the `Either` type to gracefully handle network failures and unexpected exceptions.


## 🛠️ Tech Stack & Libraries

*   **Framework**: [Flutter](https://flutter.dev/) & Dart
*   **State Management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc) (Cubit)
*   **Networking**: [Dio](https://pub.dev/packages/dio) with Interceptors
*   **Dependency Injection**: [GetIt](https://pub.dev/packages/get_it)
*   **Routing**: [GoRouter](https://pub.dev/packages/go_router)
*   **Functional Programming**: [Dartz](https://pub.dev/packages/dartz) (for `Either` and failure handling)
*   **Value Equality**: [Equatable](https://pub.dev/packages/equatable)
*   **Image Caching**: [cached_network_image](https://pub.dev/packages/cached_network_image)
*   **Fonts**: [Google Fonts](https://pub.dev/packages/google_fonts)
*   **Launcher Icons**: [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons)

## 📂 Project Structure

```
lib/
├── core/                   # Shared resources (Utilities, Errors, API services, Widgets)
├── features/               # Feature-based folder structure
│   ├── home/               # Home screen logic and UI
│   ├── search/             # Search feature logic and UI
│   └── splash/             # Splash screen
├── main.dart               # Entry point
└── ...
```

## 🚀 Getting Started

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/your-username/bookly.git
    ```
2.  **Install dependencies**:
    ```bash
    flutter pub get
    ```
3.  **Run the app**:
    ```bash
    flutter run
    ```

---
*Developed with ❤️ using Flutter*
>>>>>>> old/main
