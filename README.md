# Country Xplorer

A Flutter app for browsing and searching countries.

## Setup Instructions

1. **Install Flutter**  
   Follow the [Flutter installation guide](https://docs.flutter.dev/get-started/install) for your OS.

2. **Clone the repository**  
   ```sh
   git clone <your-repo-url>
   cd countrylens
   ```

3. **Install dependencies**  
   ```sh
   flutter pub get
   ```

4. **Run the app**  
   - For Android/iOS emulator or device:
     ```sh
     flutter run
     ```
   - For web:
     ```sh
     flutter run -d chrome
     ```

---

## State Management Flow

This project uses the **BLoC (Business Logic Component)** pattern with the `flutter_bloc` package for state management.

### How it works:

- **BLoC Layer:**  
  - The `CountriesBloc` (see `lib/src/features/home/v_models/countries_v_model.dart`) manages all logic for fetching and searching countries via a light-weight cubit.
  - It exposes methods like `fetchCountries()` and emits states based on the result.

- **State Classes:**  
  - Defined in `lib/src/config/app_state.dart` as sealed classes:
    - `InitialState`
    - `LoadingState`
    - `SuccessState`
    - `FailureState`
  - Each state can hold data, error messages, or error types

- **UI Layer:**  
  - Widgets like `CountriesList` (see `lib/src/features/home/presentation/widgets/countries_list.dart`) use `BlocBuilder` to listen for state changes.
  - The UI reacts to state:
    - Shows a loading spinner during `LoadingState`.
    - Displays a list of countries on `SuccessState`.
    - Shows retry or error messages on `FailureState`.
    - Handles search failures with a dedicated message.

- **Event Flow:**  
  - User actions (like pull-to-refresh or retry) call BLoC methods.
  - BLoC fetches data, updates state, and the UI rebuilds accordingly.

**Benefits:**  
- Clear separation of UI and business logic.
- Predictable, testable state transitions.
- Reactive UI updates.

---

**For more details, see:**
- [`countries_list.dart`](lib/src/features/home/presentation/widgets/countries_list.dart)
- [`countries_v_model.dart`](lib/src/features/home/v_models/countries_v_model.dart)
- [`app_state.dart`](lib/src/config/app_state.dart)