# Digital Hub News App

A modern Flutter news application that integrates with the NewsAPI to fetch and display the latest news articles. The app features a clean Material Design interface with authentication, search functionality, and category filtering.

## Features

### ✅ Core Features
- **User Authentication**: Login page with form validation (no API integration)
- **News Feed**: Latest news articles with card-based layout
- **Article Details**: Full article view with complete information
- **Browser Integration**: Open articles in external browser
- **Search Functionality**: Search articles by keywords
- **Category Filtering**: Filter news by categories (All, Sports, Politics, Business, Health, Science)
- **Pull to Refresh**: Refresh news feed by pulling down
- **Error Handling**: Graceful error handling with retry options
- **Empty States**: User-friendly messages when no articles are available

### 🎨 UI/UX Features
- **Material Design**: Clean and intuitive interface
- **Responsive Design**: Optimized for different screen sizes
- **Loading States**: Shimmer effects during data loading
- **Custom Fonts**: Poppins font family for better typography

## Tech Stack

- **Framework**: Flutter 3.7.2+
- **State Management**: BLoC (Business Logic Component) pattern
- **HTTP Client**: Dio for API requests
- **Navigation**: GetX for route management
- **UI Components**: Material Design with custom styling
- **API**: NewsAPI.org for news data

## Prerequisites

Before running this project, make sure you have:

- Flutter SDK (3.7.2 or higher)
- Dart SDK
- Android Studio / VS Code
- Android Emulator or Physical Device
- iOS Simulator (for iOS development)

## Installation & Setup

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/digital_hub_news_app_task.git
cd digital_hub_news_app_task
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. API Key Configuration

The app uses the NewsAPI.org service. To get your own API key:

1. Visit [NewsAPI.org](https://newsapi.org/)
2. Sign up for a free account
3. Get your API key from the dashboard
4. Replace the API key in the code:

**File**: `lib/feature/home/data/news_api_service.dart`
```dart
static const String _apiKey = 'YOUR_API_KEY_HERE';
```

**Note**: The free tier allows 100 requests per day. For production use, consider upgrading to a paid plan.

### 4. Run the Application

#### For Android:
```bash
flutter run
```

#### For iOS:
```bash
flutter run -d ios
```

#### For Web:
```bash
flutter run -d chrome
```

## Project Structure
