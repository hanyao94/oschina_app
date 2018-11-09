import 'package:flutter/material.dart';
import 'package:oschina_app/pages/NewsListPage.dart';
import 'package:oschina_app/pages/TweetsListPage.dart';
import 'package:oschina_app/pages/DiscoveryPage.dart';
import 'package:oschina_app/pages/MyInfoPage.dart';
import 'package:oschina_app/widgets/MyDrawer.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MyOSCClientState();
}

class MyOSCClientState extends State<MyApp> {
  PageController pageController;
  List<Map<String, Widget>> tabIcons;
  int page = 0;
  var appBarTitles = ['资讯', '动弹', '发现', '我的'];

  @override
  Widget build(BuildContext context) {
    init();

    var bottomBarItems = [
      new BottomNavigationBarItem(
        icon: tabIcons[0]['normal'],
        title: new Text(appBarTitles[0],
            style: new TextStyle(color: const Color(0xFF63CA6C))),
        activeIcon: tabIcons[0]['actived'],
      ),
      new BottomNavigationBarItem(
        icon: tabIcons[1]['normal'],
        title: new Text(appBarTitles[1],
            style: new TextStyle(color: const Color(0xFF63CA6C))),
        activeIcon: tabIcons[1]['actived'],
      ),
      new BottomNavigationBarItem(
        icon: tabIcons[2]['normal'],
        title: new Text(appBarTitles[2],
            style: new TextStyle(color: const Color(0xFF63CA6C))),
        activeIcon: tabIcons[2]['actived'],
      ),
      new BottomNavigationBarItem(
        icon: tabIcons[3]['normal'],
        title: new Text(appBarTitles[3],
            style: new TextStyle(color: const Color(0xFF63CA6C))),
        activeIcon: tabIcons[3]['actived'],
      ),
    ];

    // TODO: implement build
    return new MaterialApp(
      theme: new ThemeData(
          //设置页面主题色
          primaryColor: const Color(0xFF63CA6C)),
      home: new Scaffold(
        drawer: new MyDrawer(),
        appBar: new AppBar(
          //设置AppBar标题
          title: new Text(appBarTitles[page],
              style: new TextStyle(color: Colors.white)),
          centerTitle: true,
          //设置AppBar上图标样式
          iconTheme: new IconThemeData(color: Colors.white),
        ),
        body: new PageView(
          children: <Widget>[
            new NewsListPage(),
            new TweetsListPage(),
            new DiscoveryPage(),
            new MyInfoPage()
          ],
          controller: pageController,
          onPageChanged: onPageChanged,
        ),
        bottomNavigationBar: new BottomNavigationBar(
          items: bottomBarItems,
          onTap: onTap,
          currentIndex: page,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    pageController = new PageController(initialPage: this.page);
  }

  void onTap(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this.page = page;
    });
  }

  init() {
    tabIcons = [
      {
        'normal': getTabImage('images/ic_nav_news_normal.png'),
        'actived': getTabImage('images/ic_nav_news_actived.png')
      },
      {
        'normal': getTabImage('images/ic_nav_tweet_normal.png'),
        'actived': getTabImage('images/ic_nav_tweet_actived.png')
      },
      {
        'normal': getTabImage('images/ic_nav_discover_normal.png'),
        'actived': getTabImage('images/ic_nav_discover_actived.png')
      },
      {
        'normal': getTabImage('images/ic_nav_my_normal.png'),
        'actived': getTabImage('images/ic_nav_my_pressed.png')
      },
    ];
  }

  Image getTabImage(path) {
    return new Image.asset(path, width: 20.0, height: 20.0);
  }
}
