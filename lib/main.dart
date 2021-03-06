import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onboardingapp/slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoarding(),
    );
  }
}

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _currentpage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    SliderPage(
      tittle: "Keep Save",
      description:
          "Accept cryptocurrencies and digital assets, keep therm here, or send to other",
      image: "assets/1.svg",
    ),
    SliderPage(
      tittle: "Buy & Invest",
      description:
          "Buy Bitcoin and cryptocurrencies with VISA and MasterCard right in the App",
      image: "assets/2.svg",
    ),
    SliderPage(
      tittle: "Sell & Excharge",
      description:
          "Sell your Bitcoin cryptocurrencies or Change with others digital assets or flat assets",
      image: "assets/3.svg",
    ),
  ];

  _onChanged(int index) {
    setState(() {
      _currentpage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            itemCount: _pages.length,
            onPageChanged: _onChanged,
            itemBuilder: (BuildContext context, int index) {
              return _pages[index];
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                  _pages.length,
                  (int index) {
                    return AnimatedContainer(
                      duration: Duration(microseconds: 300),
                      height: 10,
                      width: (index == _currentpage) ? 30 : 10,
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: (index == _currentpage)
                              ? Colors.blue
                              : Colors.blue.withOpacity(0.5)),
                    );
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  _controller.nextPage(
                      duration: Duration(milliseconds: 800),
                      curve: Curves.easeInOutQuint);
                },
                child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: 70,
                    alignment: Alignment.center,
                    width: (_currentpage == (_pages.length - 1)) ? 200 : 70,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: (_currentpage == (_pages.length - 1))
                        ? Text(
                            "Get Started",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        : Icon(
                            Icons.navigate_next,
                            color: Colors.white,
                            size: 50,
                          )),
              ),
              SizedBox(height: 50,),
            ],
          )
        ],
      ),
    );
  }
}
