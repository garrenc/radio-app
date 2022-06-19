import 'package:flutter/material.dart';
import 'package:perm_fm/screens/list_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'info_screen.dart';
import 'player_screen.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen(this.currentTab, this.name, this.imagePath, this.url, this.number,
      this.email, this.vk, this.tg, this.website, this.adress, this.isClicked,
      {Key? key})
      : super(key: key);
  int currentTab;
  String url;
  String imagePath;
  String name;
  String number;
  String email;
  String vk;
  String tg;
  String website;
  String adress;
  bool isClicked;

  static const routeName = '/player';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_prin
    await Future.delayed(const Duration(seconds: 1));
    await Future.delayed(const Duration(seconds: 1));
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
  }

  @override
  build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        onTap: (index) {
          setState(() {
            widget.currentTab = index;
          });
        },
        currentIndex: widget.currentTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            label: 'Радио',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Список станций',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Контакты',
          )
        ],
      ),
      body: IndexedStack(
        children: <Widget>[
          PlayerScreen(
              widget.name, widget.url, widget.imagePath, widget.isClicked),
          const ListScreen(),
          InfoScreen(widget.name, widget.number, widget.email, widget.vk,
              widget.tg, widget.website, widget.adress),
        ],
        index: widget.currentTab,
      ),
    );
  }
}
