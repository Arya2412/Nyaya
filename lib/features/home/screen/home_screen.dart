import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/profile_photo.dart';
import '../widgets/search_bar.dart';
import '../widgets/carousel_slider.dart';
import '../widgets/lawyer_speciality.dart';
import 'package:nyaya/provider/user_provider.dart';
import 'package:nyaya/common/bottom_bar.dart';
import 'package:nyaya/common/loader.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    final meetings = userProvider.user.meetings.map((meeting) => meeting['imageUrl'] as String).toList();

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfilePhotoWidget(
              imageUrl: 'https://www.pexels.com/search/profile/',  //remember to replace
            ),
            SizedBox(height: 4.0),
            Text('Welcome!'),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SearchBarWidget(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Upcoming Appointments', style: Theme.of(context).textTheme.headline6),
                TextButton(
                  onPressed: () {
                    // Handle see all
                  },
                  child: Text('See All'),
                ),
              ],
            ),
          ),
          meetings.isEmpty
              ? const Loader()
              : CarouselSliderWidget(images: meetings),
          LawyerSpecialtyWidget(),
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
