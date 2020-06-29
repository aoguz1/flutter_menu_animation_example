import 'package:animations_app/widgets/flat.dart';
import 'package:flutter/material.dart';

Color backgroundColor = Color(0xff323341);
final TextStyle menuFontStyle = TextStyle(color: Colors.white, fontSize: 20);
var pageviewController = PageController(
  initialPage: 1,
);

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage>
    with SingleTickerProviderStateMixin {
  double genislik, yukseklik;
  bool menuAcikMi = false;
  Duration _duration = Duration(milliseconds: 200);
  AnimationController controller;
  Animation<double> scaleanimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this, duration: _duration);
    scaleanimation = Tween(begin: 1.0, end: 0.6).animate(controller);
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    genislik = MediaQuery.of(context).size.width;
    yukseklik = MediaQuery.of(context).size.height;
    Color backgroundColor = Color(0xff323341);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          stackmenu(context),
          stackdashboard(context),
        ],
      ),
    );
  }

  stackmenu(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FlatTexting(
            title: "Menu1",
          ),
          FlatTexting(
            title: "Menu2",
          ),
          FlatTexting(
            title: "Menu3",
          ),
          FlatTexting(
            title: "Menu4",
          ),
        ],
      ),
    );
  }

  stackdashboard(BuildContext context) {
    return AnimatedPositioned(
      bottom: 0.2,
      top: 0.2,
      left: menuAcikMi ? 0.4 * genislik : 0,
      right: menuAcikMi ? -0.2 * genislik : 0,
      duration: _duration,
      child: ScaleTransition(
        scale: scaleanimation,
        child: Material(
          elevation: 8,
          borderRadius: menuAcikMi ? BorderRadius.circular(20) : null,
          color: backgroundColor,
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                          onTap: () {
                            setState(() {
                              if (menuAcikMi) {
                                controller.reverse();
                              } else {
                                controller.forward();
                              }
                              menuAcikMi = !menuAcikMi;
                            });
                          },
                          child: Icon(
                            Icons.menu,
                            color: Colors.white,
                          )),
                      Text(
                        "Menu",
                        style: menuFontStyle,
                      ),
                      Icon(
                        Icons.add_circle_outline,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  height: 250,
                  child: PageView(
                    controller: pageviewController,
                    children: <Widget>[
                      Container(
                        width: 200,
                        height: 250,
                        color: Colors.amber,
                      ),
                       Container(
                        width: 200,
                        height: 250,
                        color: Colors.brown,
                      ),
                       Container(
                        width: 200,
                        height: 250,
                        color: Colors.amber,
                      ),
                       Container(
                        width: 200,
                        height: 250,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
