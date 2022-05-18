
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //home: const MainPage(),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final Images = [
    "assets/images/face.jpg",
    "assets/images/kobe.jpg",
    "assets/images/lagos.jpg",
    "assets/images/lamal.jpg",
    "assets/images/lion.jpg",
    "assets/images/pac.jpg",
    "assets/images/romance.jpg",
    "assets/images/teddy.jpg",
  ];
  int activeIndex = 0;
  final controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        backgroundColor: Colors.black45,
        centerTitle: true,
        title: Text("Carousel"),
      ),
      body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CarouselSlider.builder(
                    carouselController: controller,
                      itemCount: Images.length,
                    options: CarouselOptions(
                        height: 400,
                      //viewportFraction: 3,
                      enlargeCenterPage: true,
                      reverse: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      pageSnapping: false,
                      autoPlayInterval: Duration(seconds: 2),
                      enableInfiniteScroll: false
                    ),
                      itemBuilder: (context, index, realIndex){
                        final image =Images[index];

                        return buildImage(image, index);
                      },
                  ),
                ),
                SizedBox(height: 32,),
                buildIndicator(),
                SizedBox(height: 32,),
              ],
            ),
          ),

    );
  }

  Widget buildImage(String image, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      color: Colors.grey,
      child: Image.asset(
          image,
        fit: BoxFit.cover,
      )
    );
  }

 Widget buildIndicator() {
    return AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: Images.length,
      effect: JumpingDotEffect(
        dotWidth: 20,
        dotHeight: 20,
        activeDotColor: Colors.red,
        dotColor: Colors.white
      ),
    );
 }


}

