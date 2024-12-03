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

