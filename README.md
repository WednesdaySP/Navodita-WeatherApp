

# Weather Forecast App

A beautiful, real-time weather forecast application built using Flutter and Bloc for state management. The app provides accurate, location-based climate updates, showing users detailed information about the current weather, including temperature, humidity, sunrise, and sunset timings. With a modern and intuitive interface, this app delivers essential weather insights seamlessly.

## 🌟 Features

- **Real-Time Weather Updates**: Get live weather conditions based on your current location.
- **Temperature Display**: View the current temperature in Celsius or Fahrenheit.
- **Humidity Levels**: Detailed information about the humidity in your location.
- **Sunrise & Sunset Timings**: Stay informed about sunrise and sunset times to plan your day.
- **Location-Based Forecasting**: Automatically detects your location and updates weather data accordingly.
- **Error Handling**: Handles location and network errors gracefully to provide a smooth user experience.

## 🔧 Technologies Used

- **Flutter**: A UI toolkit for crafting natively compiled applications for mobile from a single codebase.
- **Bloc (Business Logic Component)**: For state management, allowing separation of business logic from the UI, resulting in a cleaner and more maintainable codebase.
- **Dio**: For making HTTP requests to fetch real-time weather data from an API.
- **Geolocator**: To retrieve the device's current location.
- **Flutter Widgets**: Including custom widgets for displaying temperature, humidity, and other weather details.

## 📲 Screenshots

![project-5](https://github.com/user-attachments/assets/bff67c44-b5c4-428a-9865-785bb155f5bc)


## 🚀 Getting Started

### Prerequisites

- **Flutter**: Ensure you have Flutter SDK installed ([Flutter Installation Guide](https://flutter.dev/docs/get-started/install)).

### Installation

1. **Clone the Repository**
   ```bash
   git clone https://github.com/WednesdaySP/Navodita-WeatherApp.git
   ```
2. **Navigate to Project Directory**
   ```bash
   cd Navodita-WeatherApp
   ```
3. **Install Dependencies**
   ```bash
   flutter pub get
   ```

### API Setup

To fetch real-time weather data, you'll need an API key from a weather service provider, such as [OpenWeatherMap](https://openweathermap.org/api).

1. Register and obtain an API key.
2. Add your API key in the `lib/constants.dart` file as follows:
   ```dart
   const String apiKey = 'YOUR_API_KEY_HERE';
   ```

### Running the App

To run the app, use the following command:

```bash
flutter run
```

## 🛠 Architecture

This app follows the **Bloc Pattern**:
- **Bloc** handles the business logic by receiving events and updating states.
- **Weather Repository** is responsible for fetching data from the API and handling data transformations.
- **UI Layer** uses BlocBuilder to listen to state changes and update the UI accordingly.

## 📚 Project Structure

```
lib/
├── blocs/                  # Bloc files (events, states, blocs)
├── models/                 # Data models (e.g., weather, location)
├── repository/             # Weather data fetching logic
├── screens/                # App screens
├── widgets/                # Reusable custom widgets
└── main.dart               # Main entry point
```

## 💡 Usage

1. Open the app to automatically see weather data for your current location.
2. Swipe down to refresh the weather data if needed.
3. View detailed weather insights, including temperature, humidity, and sunrise/sunset timings.

## 📌 Future Enhancements

- **Hourly and Weekly Forecasts**: Expand to show upcoming weather data.
- **Multi-Language Support**: Provide weather information in multiple languages.
- **Enhanced UI/UX**: Add animations and visual improvements.

## 📄 License

This project is licensed under the MIT License.

---

