import 'package:flutter/material.dart';
import 'package:oschina_app/pages/NewsDetailPage.dart';

class NewsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new RaisedButton(onPressed: () {
        Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) {
          return new NewsDetailPage();
          
        }));
      }),
    );
  }
}
