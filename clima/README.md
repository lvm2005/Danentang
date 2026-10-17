# flutter_vku_lab9

Flutter weather app for the VKU lab.

## Getting Started

Get an API key from OpenWeatherMap and provide it at launch. Do not commit the
key to source control.

```powershell
flutter pub get
flutter run --dart-define=OPENWEATHER_API_KEY=your_api_key
```

Replace `your_api_key` with your own key. The app reports a configuration error
if the key is not provided.
