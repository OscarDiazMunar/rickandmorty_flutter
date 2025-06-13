# Rick and Morty Flutter App

Rick and Morty Flutter App is a modern Flutter Multiplatform application built using **Clean Architecture**, following best practices to ensure maintainability, scalability, and testability. The app fetches Rick and Morty data from an API Rest, supports pagination, uses image loading.

## 📂 Project Structure

The project follows **Clean Architecture**, which divides the codebase into three layers:

### 1️⃣ **Presentation Layer**

- Implements **MVVM (Model-View-ViewModel) architecture**.
- Uses **Bloc** for State Management.
- Handles user interactions and UI state.
- Uses **Get_it** as Service Locator for dependency injection.

### 2️⃣ **Domain Layer**

- Contains **use cases** that encapsulate business logic.
- Defines repository interfaces.
- Independent of frameworks and UI.

### 3️⃣ **Data Layer**

- Implements repositories and data sources.
- Uses **DIO** for network requests.
- Implements pagination with **infinite_scroll_pagination**.

## 🛠️ Tech Stack

- **Dart** - Modern, concise, and expressive language.
- **Clean Architecture** - Separation of concerns for better maintainability.
- **MVVM** - Architecture pattern for handling UI and state.
- **Get_it** - Dependency Injection framework.
- **DIO** - For networking and API-Rest calls.
- **infinite_scroll_pagination** - Efficient data loading with pagination.
- **Image** - Image loading and caching.
- **dartz** - Functional Programming in Dart.

## 🔧 Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/OscarDiazMunar/rickandmorty_flutter.git
   ```
2. Open the project in **Android Studio**.
3. Sync Gradle and run the app on an emulator or a physical device.

## 🚀 Features

✅ Fetch Characters list from API-Rest\
✅ Implement infinite scrolling with infinite_scroll_pagination\
✅ Load images efficiently with Image\
✅ Follow Clean Architecture best practices

## 📸 Screenshots

Here are some screenshots of Rick and Morty in action:

### Home Screen
<p align="center">
  <img width="270" src="https://github.com/OscarDiazMunar/rickandmorty_flutter/blob/main/screenshots/screen1.png"/>
</p>

### Movie Details
<p align="center">
  <img width="270" src="https://github.com/OscarDiazMunar/rickandmorty_flutter/blob/main/screenshots/screen2.png"/>
</p>

<p align="center">
  <img width="270" src="https://github.com/OscarDiazMunar/rickandmorty_flutter/blob/main/screenshots/screen3.png"/>
</p>
