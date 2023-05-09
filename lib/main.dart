import 'package:flutter/material.dart';
import 'package:flutter_app_0/profile.dart';
import 'widgets/card.dart';
import 'widgets/header.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Otaku+',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    WelcomePage(),
    WelcomePage(),
    WelcomePage(),
    WelcomePage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyHeader(),
      body: IndexedStack(
        index: _currentIndex,
        children: _children,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Likes',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 14,
              backgroundImage: AssetImage('assets/stores/pfp.jpg'),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Sélection du moment',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: () {
                    // handle filter button press
                  },
                ),
              ],
            ),
            SizedBox(height: 14.0),
            CustomCard(
                title: 'Demon Slayer',
                subtitle: 'Le quiz général',
                imageUrl: 'assets/stores/demon_slayer.png',
                quiz: 'assets/stores/quiz_01.json'),
            SizedBox(
              height: 16.0,
            ),
            CustomCard(
                title: 'Jujutsu Kaisen',
                subtitle: 'Le quiz général',
                imageUrl: 'assets/stores/jjk.jpg',
                quiz: 'assets/stores/quiz_02.json'),
            SizedBox(
              height: 16.0,
            ),
            CustomCard(
                title: "Hell's Paradise",
                subtitle: 'Le quiz général',
                imageUrl: 'assets/stores/hp.jpg',
                quiz: 'assets/stores/quiz_03.json'),
            SizedBox(
              height: 16.0,
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: [
                CustomCard(
                    title: 'Jujutsu Kaisen',
                    subtitle: 'Le quiz général',
                    imageUrl: 'assets/stores/jjk.jpg',
                    quiz: 'assets/stores/quiz_02.json'),
                CustomCard(
                    title: 'Hell\'s Paradise',
                    subtitle: 'Le quiz général',
                    imageUrl: 'assets/stores/hp.jpg',
                    quiz: 'assets/stores/quiz_03.json'),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text(
                  'Shonen',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.arrow_right_alt),
                  onPressed: () {
                    // handle filter button press
                  },
                ),
              ],
            ),
            SizedBox(
              height: 14,
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: [
                CustomCard(
                    title: 'Jujutsu Kaisen',
                    subtitle: 'Le quiz général',
                    imageUrl: 'assets/stores/jjk.jpg',
                    quiz: 'assets/stores/quiz_02.json'),
                CustomCard(
                    title: 'Hell\'s Paradise',
                    subtitle: 'Le quiz général',
                    imageUrl: 'assets/stores/hp.jpg',
                    quiz: 'assets/stores/quiz_03.json'),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text(
                  'Shojo',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.arrow_right_alt),
                  onPressed: () {
                    // handle filter button press
                  },
                ),
              ],
            ),
            SizedBox(
              height: 14,
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: [
                CustomCard(
                    title: 'Jujutsu Kaisen',
                    subtitle: 'Le quiz général',
                    imageUrl: 'assets/stores/jjk.jpg',
                    quiz: 'assets/stores/quiz_02.json'),
                CustomCard(
                    title: 'Hell\'s Paradise',
                    subtitle: 'Le quiz général',
                    imageUrl: 'assets/stores/hp.jpg',
                    quiz: 'assets/stores/quiz_03.json'),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text(
                  'Seinen',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.arrow_right_alt),
                  onPressed: () {
                    // handle filter button press
                  },
                ),
              ],
            ),
            SizedBox(
              height: 14,
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: [
                CustomCard(
                    title: 'Jujutsu Kaisen',
                    subtitle: 'Le quiz général',
                    imageUrl: 'assets/stores/jjk.jpg',
                    quiz: 'assets/stores/quiz_02.json'),
                CustomCard(
                    title: 'Hell\'s Paradise',
                    subtitle: 'Le quiz général',
                    imageUrl: 'assets/stores/hp.jpg',
                    quiz: 'assets/stores/quiz_03.json'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
