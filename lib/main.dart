import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:remixicon/remixicon.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RPP Mobile APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Change the duration to your preference
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background with three vertical colors
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.yellow,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.blue,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.red,
                ),
              ),
            ],
          ),
          // Center content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Image.asset(
                  'assets/rpp.png',
                  height: 100.0, // Adjust the height according to your image
                ),
                SizedBox(height: 20.0),
                // Text below the logo
                Text(
                  'WELCOME TO RPP MOBILE APP',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isLargeScreen = width > 800;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        toolbarHeight:70.00,
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 0,
leading: IconButton(
  icon: const Icon(Remix.menu_2_line),
  onPressed: () => _scaffoldKey.currentState?.openDrawer(),
),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Image.asset(
                'assets/rpp.png',
                height: 50.0,
                 fit: BoxFit.contain,// Adjust the height according to your image
              ),
              if (isLargeScreen) Expanded(child: _navBarItems())
            ],
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child:  Row(
              children: [
                CircleAvatar(child: Icon(Remix.notification_line,color: Color(0xFFFFFFFF)),backgroundColor: Color(0xFF3E315F)),
                SizedBox(width: 10),
                CircleAvatar(child: _ProfileIcon(),backgroundColor: Color(0xFF3E315F)),
              ],
            ),
          )
        ],
      ),
      drawer: isLargeScreen ? null : _drawer(),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(
              Remix.home_4_line, // Example of using a Remix Icon
              size: 25.0,
              color: Colors.black,
            ),
            title: Text("Home"),
            selectedColor: Colors.red,
          ),

          /// Notice
          SalomonBottomBarItem(
            icon: Icon(
              Remix.article_line,
              size: 25.0,
              color: Colors.black,
            ),
            title: Text("Notices"),
            selectedColor: Colors.red,
          ),
          /// Profile
          SalomonBottomBarItem(
            icon: Container(
              padding: EdgeInsets.all(10.0), // Adjust the padding as needed
              decoration: BoxDecoration(
                color: Colors.yellow, // Fill color
                shape: BoxShape.circle, // Use BoxShape.circle if you want a circular fill
              ),
              child: Icon(
                Remix.user_add_line,
                size: 40.0,
                color: Colors.black,
              ),
            ),

            unselectedColor: Colors.yellow,
            title: Text(""),
            selectedColor: Colors.yellow,
          ),
          /// Events
          SalomonBottomBarItem(
            icon: Icon(
              Remix.calendar_2_line,
              size: 25.0,
              color: Colors.black,
            ),
            title: Text("Search"),
            selectedColor: Colors.red,
          ),

          /// Others
          SalomonBottomBarItem(
            icon: Icon(
              Remix.dice_fill,
              size: 25.0,
              color: Colors.black,
            ),
            title: Text("Others"),
            selectedColor: Colors.red,
          ),
        ],
      ),
      body: Center(
        child: Text('Welcome to the Home Screen of RPP'),
      ),
    );
  }
  Widget _drawer() => Drawer(
    child: Container(
      color: Colors.white,
      child:ListView(
      children: _menuItems
          .map((item) => ListTile(
        leading: Icon(Remix.remix_run_fill), // Add this line to include an icon
        onTap: () {
          _scaffoldKey.currentState?.openEndDrawer();
        },
        title: Text(item),
      ))
          .toList(),
    ),
    ),
  );

  Widget _navBarItems() => Column(
    children: [
      Container(
        color: Colors.red,
        height: 2.0,
        width: double.infinity,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _menuItems
            .map(
              (item) => InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 24.0, horizontal: 16),
              child: Text(
                item,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        )
            .toList(),
      ),
      Container(
        color: Colors.red,
        height: 2.0,
        width: double.infinity,
      ),
    ],
  );

}
final List<String> _menuItems = <String>[
  'घर',
  'दल',
  'नेतृत्व',
  'आगामी कार्यक्रमहरू',
  'हाम्रो यात्रा',
  'चन्दा',
  'सम्पर्क',
  'डाउनलोड',
  'मिडिया',
  'हाम्रोबारे',
  'प्रतिक्रिया',
];

enum Menu { itemOne, itemTwo, itemThree }

class _ProfileIcon extends StatelessWidget {
  const _ProfileIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Menu>(
        icon: const Icon(Remix.user_line,color: Color(0xFFFFFFFF)),
        offset: const Offset(0, 40),
        onSelected: (Menu item) {},
        itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
          const PopupMenuItem<Menu>(
            value: Menu.itemOne,
            child: Text('Account'),
          ),
          const PopupMenuItem<Menu>(
            value: Menu.itemTwo,
            child: Text('Settings'),
          ),
          const PopupMenuItem<Menu>(
            value: Menu.itemThree,
            child: Text('Sign Out'),
          ),
        ]);
  }
}