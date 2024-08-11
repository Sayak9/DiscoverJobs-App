import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';
import 'model.dart';

class CustomBottomSheet extends GetWidget<HomeController> {

  final Photo photo;
  final HomeController _homeController = Get.find<HomeController>();

  CustomBottomSheet({Key? key, required this.photo}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.55,
      minChildSize: 0.2,
      maxChildSize: 0.95,
      builder: (_, scrollController) {
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ListView(
                controller: scrollController,
                padding: const EdgeInsets.fromLTRB(38, 42, 20, 20),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                         _truncateText(photo.title, 2),
                          style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                          maxLines: 1,

                        ),
                      ),
                      Obx(() => IconButton(
                        icon: Icon(

                          _homeController.isJobFavorited(photo.id)
                              ? Icons.star
                              : Icons.star_border,

                          color: Colors.grey,
                        ),
                        onPressed: () => _homeController.toggleFavorite(photo.id),
                      )),
                    ],
                  ),

                  Text('Silicon Valley, CA',style: TextStyle(fontSize:15, color: Colors.grey[500], fontWeight: FontWeight.w600),),
                  SizedBox(height: 8),
                  Text(photo.url, style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w600)),
                  SizedBox(height: 50),
                  Text('Position:', style: TextStyle(fontSize:11, color: Colors.grey[600], fontWeight: FontWeight.w600)),
                  Text('Based on photo ID: ${photo.id}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  SizedBox(height: 25),
                  Text('Qualifications:', style: TextStyle(fontSize:11, color: Colors.grey[600], fontWeight: FontWeight.w600)),
                  Text(photo.title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                  SizedBox(height: 35),

                ],
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              bottom: 5,
              child: Padding(
                padding:  EdgeInsets.only(left: 25, right: 20),
                child: ElevatedButton(
                  child: Text('APPLY NOW',style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(

                    foregroundColor: Colors.indigo[400],
                    backgroundColor: Colors.indigo[400],
                    shadowColor: Colors.indigo[200],
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.indigo[50]!, width: 5),
                    ),
                  ),
                  onPressed: () {

                    _homeController.applyForJob(photo.id);

                    Get.back();

                    Get.snackbar(
                      'Success',
                      'Job Applied Successfully',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                      duration: Duration(seconds: 2),
                    );



                  },
                ),
              ),
            ),


            Positioned(
              top: -5,
              left: 35,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(photo.thumbnailUrl),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  String _truncateText(String text, int maxWords) {
    final words = text.split(' ');
    return words.take(maxWords).join(' ');

  }

}