import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_dress_app/home.dart';
import 'package:my_dress_app/signin.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  double scrollerPosition = 0;

  onButtonPressed(context) {
    return Navigator.push(context, MaterialPageRoute(builder: (ctx) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          onPageChanged: (val) {
            setState(() {
              scrollerPosition = val.toDouble();
            });
          },
          children: [
            OnBoardPage(
              bordColumn: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Welcome\n To Textile App",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 32),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "+10 Million Products\n+100 Categories\n+20 Brands",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow,
                        fontSize: 28),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 300,
                      width: 300,
                      child: Image.asset('assets/s1.jpg')),
                ],
              ),
            ),
            OnBoardPage(
              bordColumn: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "7-14 Days Return",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 32),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Satisfaction Guaranteed",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow,
                        fontSize: 24),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 300,
                      width: 300,
                      child: Image.asset('assets/s2.jpg')),
                ],
              ),
            ),
            OnBoardPage(
              bordColumn: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Find Your Favourite\nProducts",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 32),
                  ),
                  SizedBox(
                      height: 300,
                      width: 300,
                      child: Image.asset('assets/s5.jpg')),
                ],
              ),
            ),
            OnBoardPage(
              bordColumn: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Experience Smart Shopping",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 32),
                  ),
                  SizedBox(
                      height: 300,
                      width: 300,
                      child: Image.asset('assets/s3.jpg')),
                ],
              ),
            ),
            OnBoardPage(
              bordColumn: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Safe & Secure\nPayments",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 32),
                  ),
                  SizedBox(
                      height: 300,
                      width: 300,
                      child: Image.asset('assets/s6.jpg')),
                ],
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DotsIndicator(
                dotsCount: 5,
                position: scrollerPosition,
                decorator: DotsDecorator(activeColor: Colors.black),
              ),
              scrollerPosition == 4
                  ? Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black)),
                          onPressed: () {
                            onButtonPressed(context);
                          },
                          child: const Text("Let'S Start Shopping")),
                    )
                  : TextButton(
                      child: const Text(
                        "SKIP TO THE APP>",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      onPressed: () {
                        onButtonPressed(context);
                      },
                    ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        )
      ],
    ));
  }
}

class OnBoardPage extends StatelessWidget {
  final Column? bordColumn;
  const OnBoardPage({Key? key, this.bordColumn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.transparent,
          child: Center(child: bordColumn),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 120,
            decoration: BoxDecoration(
                color: Colors.blueGrey[600],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100))),
          ),
        )
      ],
    );
  }
}
