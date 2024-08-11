import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'controller.dart';
import 'customBottomSheet.dart';
import 'model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>  {

  final HomeController _homeController = Get.find<HomeController>();
  final TextEditingController _searchController = TextEditingController();
  List<Photo> _filteredPhotoList = [];
  bool _showSearchBar = false;

  @override
  void initState() {
    super.initState();
    _filteredPhotoList = _homeController.photoList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110.0,

        actions: [

          Padding(
            padding: EdgeInsets.only(right: 30.0, top: 11),

            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _showSearchBar
                    ? Flexible(
                        child: Container(
                          width: 200.0,
                          height: 35.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [

                              Flexible(
                                child: TextField(
                                  controller: _searchController,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 10.0, bottom: 10),
                                    hintText: 'Search Jobs...',
                                    border: InputBorder.none,
                                  ),
                                  onSubmitted: (query) {
                                    _filterPhotos(query);
                                    setState(() {
                                      _showSearchBar = false;
                                    });
                                  },
                                ),
                              ),

                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 10.0),
                                child: Icon(FontAwesomeIcons.magnifyingGlass, size: 18),
                              ),
                            ],
                          ),
                        ),
                      )

                :Stack(
                  alignment: Alignment.center,

                children: [

                  Container(
                    width: 65.0,
                    height: 35.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),

                    ),
                  ),

                  IconButton(
                  icon: Icon(FontAwesomeIcons.magnifyingGlass, size: 18,),
                  onPressed: () {

                      setState(() {
                            _showSearchBar = true;
                          });
                  },
                ),
               ]
              ),
      ]
            ),
          ),
        ],
      ),
      drawer: Padding(
        padding: EdgeInsets.only(left: 16.0),
        child: Drawer(
          child: ListView(
            children: [

            ],
          ),
        ),
      ),
      body: Obx(
            () {
          if (_homeController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding:  EdgeInsets.only(left: 16.0,right: 16, top: 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                      'Find your Dream',
                      style: TextStyle(
                        fontSize: 33.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.0, bottom: 4),
                    child: Text(
                      'Job today',
                      style: TextStyle(
                        fontSize: 33.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _filteredPhotoList.length,
                      itemBuilder: (context, index) {
                        final photo = _filteredPhotoList[index];
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                          child: Card(

                            color: Colors.white,
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 14.0, bottom: 14),
                              child: ListTile(
                                
                                  onTap: () {

                                    Get.bottomSheet(
                                      CustomBottomSheet(photo: photo),
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                    );

                                  },

                                //  contentPadding: EdgeInsets.symmetric(horizontal: 6),
                                leading: Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Container(
                                    width: 60,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(17.0),
                                      child: Image.network(
                                        photo.thumbnailUrl,
                                        //fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  _truncateText(photo.title, 2),
                                  maxLines: 1,
                                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                                ),
                                subtitle: Text(photo.title, maxLines: 1,style: TextStyle(color: Colors.grey),),
                                trailing: Obx(() => Container(
                                  width: 25.0,
                                  height: 25.0,
                                  decoration: BoxDecoration(
                                    color:  _homeController.isJobApplied(photo.id)
                                        ? Colors.green
                                        : Colors.indigo[400],
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      FontAwesomeIcons.suitcase,
                                      color: Colors.white,
                                      size: 9.0,
                                    ),
                                  ),
                                ),
                        )),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  String _truncateText(String text, int maxWords) {
    final words = text.split(' ');
    return words.take(maxWords).join(' ');

  }

  void _filterPhotos(String query) {

    _filteredPhotoList = _homeController.photoList.where((photo) =>
        photo.title.toLowerCase().contains(query.toLowerCase())).toList();
    setState(() {});
  }

  }
