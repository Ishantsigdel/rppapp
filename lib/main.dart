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
                  'assets/cowrpp.png',
                  height: 100.0, // Adjust the height according to your image
                ),
                SizedBox(height: 20.0),
                // Text below the logo
                Text(
                  'WELCOME TO RPP MOBILE APP',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 246, 245, 245),
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
      body:SingleChildScrollView( // Wrap the content in a SingleChildScrollView
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: [
              // Nested Boxes
              Container(
                width: 314.0, // Box 1 width
                height: 314.0, // Box 1 height
                color: Color(0xFFFACC2C), // Box 1 color
                child: Center(
                  child: Container(
                    width: 275.0, // Box 2 width
                    height: 275.0, // Box 2 height
                    color: Color(0xFFC6322E), // Box 2 color
                    child: Center(
                      child: Container(
                        width: 220.0, // Box 3 width (image container)
                        height: 220.0, // Box 3 height (image container)
                        child: Image.asset(
                          'assets/Rajendra lingden.jpg', // Replace with your image asset
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.0), // Space between the two sections

              // Namaste Icon, Title, and Description
              
              
              Container(
  width: 326.0,
  height: 280.0,
  decoration: BoxDecoration(
    color: Color.fromARGB(255, 235, 30, 15),
    borderRadius: BorderRadius.circular(20.0), // Optional: adds rounded corners to the box
  ),
  padding: EdgeInsets.all(6.0), // Optional: padding inside the box
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
    crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
    
    children: [
      Image.asset(
        'assets/cowrpp.png',
        width: 100.0, // Adjust the size of the image
        height: 100.0,
      ),
      SizedBox(height: 8.0), // Space between icon and title
      Text(
        'Welcome to '
        'Rastriya Prajatantra'
        ' Party',
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        textAlign: TextAlign.center, // Center-align the text
      ),
      SizedBox(height: 8.0), // Space between title and description
      Text(
        'राप्रपा प्रजातन्त्र प्रति मन, वचन र ' 
        'कर्मले प्रतिबद्ध\n सु-स्पष्ट विचार र अलग '
        'पहिचान सहितको राजनीतिक दल हो । ',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
        textAlign: TextAlign.center, // Center-align the text
      ),
    ],
  ),
),

SizedBox (height: 30.0),
Container(
  width: 326.0,
  height: 392.0,
  decoration: BoxDecoration(
    color: Color.fromARGB(255, 235, 30, 15),
    borderRadius: BorderRadius.circular(20.0), // Optional: adds rounded corners to the box
  ),
  padding: EdgeInsets.only(top: 10.0,left: 16.0,right: 16.0,bottom: 16.0), // Optional: padding inside the box
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
    crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
    children: [
       Image.asset(
        'assets/icon1.png',
        width: 300.0, // Adjust the size of the image
        height: 180.0,
      ),
    
      SizedBox(height: 10.0), // Space between icon and title
      Text(
        'राष्ट्रिय प्रजातन्त्र पार्टी\n'
        'सम्बन्धित जानकारी',
        style: TextStyle(
          fontSize: 17.0,
          // fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        textAlign: TextAlign.center, // Center-align the text
      ),
      SizedBox(height: 20.0), // Space between text and buttons
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 137.0,
            height: 33.0,
            child: ElevatedButton(
              onPressed: () {
                // Action for the "Read" button
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Button background color
                foregroundColor: Color.fromARGB(255, 2, 2, 2), // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Text(
                'पढ्नुहोस्',
                style: TextStyle(
                  fontSize: 16.0,
                  color: const Color.fromARGB(255, 8, 8, 8), // Button text color
                ),
              ),
            ),
          ),
           SizedBox(height: 10.0),
          SizedBox(
            width: 190.0,
            height: 32.0,
            child: ElevatedButton(
              onPressed: () {
                // Action for the "Download" button
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 7, 2, 73), // Button background color
                foregroundColor: const Color.fromARGB(255, 251, 250, 250), // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Text(
                'डाउनलोड गर्नुहोस्',
                style: TextStyle(
                  fontSize: 16.0,
                  color: const Color.fromARGB(255, 247, 244, 243), // Button text color
                ),
              ),
            ),
          ),
        ],
      ),
        // Center-align the text
      Spacer(), //pushes the content upwards
    ],
  ),
),

SizedBox (height: 30.0),
Container(
  width: 326.0,
  height: 127.0,
  decoration: BoxDecoration(
    color: Color.fromARGB(255, 235, 30, 15),
    borderRadius: BorderRadius.circular(20.0), // Optional: adds rounded corners to the box
  ),
  padding: EdgeInsets.all(16.0), // Padding inside the box
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between text and icon
    children: [
      // Column for text
      Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
        mainAxisAlignment: MainAxisAlignment.start, // Align text to the top
        children: [
          Text(
            'सदस्य हुन',
            style: TextStyle(
              fontSize: 17.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.0), // Space between the two text lines
          Text(
            'सदस्यता फारम भर्नुहोस्',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10.0), // Space between text and button
          SizedBox(
            width: 103.0,
            height: 32.0,
            child: ElevatedButton(
              onPressed: () {
                // Action for the button
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 7, 2, 73), // Button background color
                foregroundColor: Colors.white, // Button text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Text(
                'सदस्य हुन',
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
        ],
      ),
      // Icon aligned to the right
      Image.asset(
        'assets/form (2).png',
        width: 60.0, // Adjust the size of the image
        height: 60.0,
      ),
    
    ],
  ),
),


SizedBox (height: 30.0),
Container(
  width: 326.0,
  height: 169.0,
  decoration: BoxDecoration(
    color: Color.fromARGB(255, 196, 195, 194),
    borderRadius: BorderRadius.circular(20.0), // Optional: adds rounded corners to the box
  ),
  padding: EdgeInsets.all(16.0), // Padding inside the box
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between text and icon
    children: [
      // Column for text
      Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
        mainAxisAlignment: MainAxisAlignment.start, // Align text to the top
        children: [
          Text(
            'हामी सधैंभरि उपलब्ध छौं',
            style: TextStyle(
              fontSize: 17.0,
              color: const Color.fromARGB(255, 15, 14, 14),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0), // Space between the two text lines
          Text(
            '9999999999',
            style: TextStyle(
              fontSize: 14.0,
              color: const Color.fromARGB(255, 13, 13, 13),
            ),
          ),
          SizedBox(height: 20.0), // Space between text and button
          SizedBox(
            width: 130.0,
            height: 42.0,
            child: ElevatedButton(
              onPressed: () {
                // Action for the button
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 7, 2, 73), // Button background color
                foregroundColor: Colors.white, // Button text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Text(
                'सम्पर्क गर्नुहोस',
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
        ],
      ),
      // Icon aligned to the right
      Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
        mainAxisAlignment: MainAxisAlignment.start, // Align text to the top
        children: [
          Image.asset(
        'assets/phone.png',
        width: 20.0, // Adjust the size of the image
        height: 20.0,
      ),
      SizedBox(height: 40.0),
      Image.asset(
        'assets/form (2).png',
        width: 60.0, // Adjust the size of the image
        height: 60.0,
      ),
      
        ],
      ),
      
    ],
  ),
)




            ],
          ),
        ),
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