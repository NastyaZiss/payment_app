import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:payment_app/component/colors.dart';
import 'package:payment_app/widgets/large_button.dart';
import 'package:payment_app/widgets/sized_text.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String backgroundImage =
      'https://klike.net/uploads/posts/2022-12/1670324600_3-24.jpg';
  final curveImage = AssetImage('img/curve4.png');
  final button_line = NetworkImage(
      'https://artro-optima.nl/wp-content/uploads/2017/07/list-goeie-1030x1030.png');
  final icon_marketR = NetworkImage(
      'https://garden-zoo.ru/userfiles/иконки/я.маркет%20-%20Copy%201.png');
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: Container(
        height: h,
        child: Stack(
          children: [
            _headSection(),
            _listBills(),
            _payButton(),
          ],
        ),
      ),
    );
  }

  _headSection() {
    return Container(
      height: 310,
      color: Colors.red[300],
      child: Stack(
        children: [
          _mainBackground(),
          _curveImageContainer(),
          _buttonContainer(),
        ],
      ),
    );
  }

  _buttonContainer() {
    return Positioned(
      right: 48,
      bottom: 15,
      child: Container(
        height: 55,
        width: 50,
        decoration: BoxDecoration(
            image: DecorationImage(image: button_line),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                offset: Offset(0, 0.1),
                color: Color(0xff11324d).withOpacity(0.05),
              )
            ]),
      ),
    );
  }

  _mainBackground() {
    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(backgroundImage),
          ),
        ),
      ),
    );
  }

  _curveImageContainer() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        // color: Colors.indigo,
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.3,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: (curveImage),
          ),
        ),
      ),
    );
  }

  _listBills() {
    return Positioned(
      top: 320,
      left: 0,
      right: 0,
      bottom: 0,
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
          itemBuilder: (_, index) {
            return Container(
              margin: const EdgeInsets.only(top: 20, right: 20),
              height: 130,
              width: MediaQuery.of(context).size.width - 20,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFd8dbe0),
                      offset: Offset(1, 1),
                      blurRadius: 20.0,
                      spreadRadius: 10,
                    )
                  ]),
              child: Container(
                margin: const EdgeInsets.only(top: 10, left: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover, image: icon_marketR),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ЯндексМаркет',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.mainColor,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  'Id: 84694',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.mainColor,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        SizedText(
                            text: 'Auto pay on 24th May 18',
                            color: AppColor.green),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              child: Center(
                                  child: Text(
                                'Select',
                                style: TextStyle(
                                    fontSize: 16, color: AppColor.selectColor),
                              )),
                              width: 80,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: AppColor.selectBackground),
                            ),
                            Expanded(child: Container()),
                            Text(
                              '1200 p',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColor.mainColor,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text(
                              'Due in 3 days',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColor.idColor,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        Container(
                          width: 5,
                          height: 35,
                          decoration: BoxDecoration(color: AppColor.halfOval),
                          child: Text(''),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _payButton() {
    return Positioned(
        bottom: 20,
        child: AppLargeButton(
          text: 'Pay all bills',
          textColor: Colors.white,
        ));
  }
}
