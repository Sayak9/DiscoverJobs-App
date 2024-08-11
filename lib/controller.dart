import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model.dart';


class HomeController extends GetxController {

  var isLoading = true.obs;
  var photoList = <Photo>[].obs;
  RxSet<int> appliedJobs = <int>{}.obs;
  RxSet<int> favoritedJobs = <int>{}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPhotos();
  }

  Future<void> fetchPhotos() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1/photos'));
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        photoList.value = jsonList.map((json) => Photo.fromJson(json)).toList();
      }
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      isLoading(false);
    }
  }

  void applyForJob(int photoId) {
    appliedJobs.add(photoId);
  }

  bool isJobApplied(int photoId) {
    return appliedJobs.contains(photoId);
  }

  void toggleFavorite(int photoId) {
    if (favoritedJobs.contains(photoId)) {
      favoritedJobs.remove(photoId);
    } else {
      favoritedJobs.add(photoId);
    }
  }

  bool isJobFavorited(int photoId) {
    return favoritedJobs.contains(photoId);
  }

}
