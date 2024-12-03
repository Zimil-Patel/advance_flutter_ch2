# advance_flutter_ch2

## ✔️ 9.2 Call Pixabay API & Represent in UI. [📂 (source)](https://github.com/Zimil-Patel/advance_flutter_ch2/tree/main/lib/pixabay%20api)

This is a Flutter application that interacts with the Pixabay API. Users can search for images, view image details, and perform actions such as commenting and downloading images.

## Features

- **Search for Images**: Users can search for images by keywords.
- **Filter Options**: The app supports filters like `image_type="photo"` and `orientation="horizontal"`.
- **Image Details**: Display images with their user details, including name, number of comments, and download options.
- **Provider Integration**: State management is handled using the `provider` package for efficient UI updates.

## App Usage

1. Open the app, and you’ll be presented with a search field where you can enter keywords to search for images.
2. The app fetches data from the Pixabay API and displays the images in a list.
3. Each image has details such as:
   - Image description
   - User who uploaded the image
   - The number of comments
4. Users can click on an image to view additional details or download the image.

### Example Code for API Request

```dart
import 'package:http/http.dart' as http;
import 'dart:convert';

class PixabayApiProvider {
  final String apiKey = 'your-api-key';
  
  Future<List<ImageModel>> fetchImages(String query) async {
    final url =
        'https://pixabay.com/api/?key=$apiKey&q=$query&image_type=photo&orientation=horizontal';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['hits'] as List)
          .map((json) => ImageModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load images');
    }
  }
}
```


### Screenshots 📷

<div align="left">
<img src= "https://github.com/Zimil-Patel/advance_flutter_ch2/blob/main/snaps/9.2/snap1.png" height = 590 width = 300> &nbsp;&nbsp;&nbsp;&nbsp; <img src= "https://github.com/Zimil-Patel/advance_flutter_ch2/blob/main/snaps/9.2/snap2.png" height = 590 width = 300> &nbsp;&nbsp;&nbsp;&nbsp; <img src= "https://github.com/Zimil-Patel/advance_flutter_ch2/blob/main/snaps/9.2/snap3.png" height = 590 width = 300> &nbsp;&nbsp;&nbsp;&nbsp; <img src= "https://github.com/Zimil-Patel/advance_flutter_ch2/blob/main/snaps/9.2/snap4.png" height = 590 width = 300> &nbsp;&nbsp;&nbsp;&nbsp;
</div>

### Video Preview 🎥


https://github.com/user-attachments/assets/73e13c24-bda9-4a9f-90bb-f7a307baaad4

## ✔️ Api Example [📂 (source)](https://github.com/Zimil-Patel/advance_flutter_ch2/tree/main/lib/api%20call%20example)

Here’s a GitHub documentation for your project that fetches dummy JSON data using `http` and processes the response:

---

# Dummy JSON Data Fetcher App

This Flutter app fetches data from a dummy API endpoint (`https://jsonplaceholder.typicode.com/users`) and processes it to display a list of users. The app uses the `http` package to make the API call and a Singleton class for handling API requests. This documentation outlines the steps to set up and use the app.

## Features

- **API Integration**: Fetches data from a dummy endpoint using the `http` package.
- **Data Processing**: Converts JSON response into a list of user models.
- **State Management**: Uses `Provider` for state management to update the UI when data is fetched.
- **Error Handling**: Catches errors if the API call fails.

### Example Code for API Call

#### 1. **API Helper Class** (Singleton Pattern for API Calls)

This class handles the HTTP request and processes the response.

```dart
  // API Calling Method
  Future<String> callApi(String api) async {
    this.api = api;
    
    Uri uri = Uri.parse(this.api);

    try {
      // Make GET Request
      http.Response response = await http.get(uri);

      // Check Response Status
      if (response.statusCode == 200) {
        log("API called successfully...");
        return response.body; // Return body if successful
      } else {
        log("API calling failed!!!");
        return ""; // Return empty string in case of failure
      }
    } catch (e) {
      log("Error fetching API records: $e");
      return ""; // Return empty string in case of an exception
    }
  }
}
```

#### 2. **User Data Fetching**

In your main app logic, you can call the API helper and update the state.

```dart
try {
  log("User fetch called ---------------");
  String response = await ApiHelper.apiHelper.callApi('https://jsonplaceholder.typicode.com/users');
  if (response.isNotEmpty) {
    List<dynamic> jsonData = jsonDecode(response); // Decode JSON response
    userList = jsonData.map((e) => User.fromJson(e)).toList(); // Convert to List of User objects
    notifyListeners(); // Notify listeners to update UI
  }
} catch (e) {
  log("Error fetching API records: $e...");
}
```

### Screenshots 📷

<div align="left">
<img src= "https://github.com/Zimil-Patel/advance_flutter_ch2/blob/main/snaps/%20api%20example/snap1.png" height = 590 width = 300> &nbsp;&nbsp;&nbsp;&nbsp;
</div>


