import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'model/article.dart';
import 'package:url_launcher/url_launcher.dart';
class NewsDtails extends StatefulWidget {
  Article article;
  NewsDtails({this.article});
  @override
  _NewsDtailsState createState() => _NewsDtailsState(article: article);
}

class _NewsDtailsState extends State<NewsDtails> {
  Article article;
  _NewsDtailsState({this.article});
  Future<void> launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("تفاصيل الخبر"),centerTitle: true,),
      body: SingleChildScrollView(
        child: Column(
         // textDirection: TextDirection.rtl,
          
          mainAxisAlignment: MainAxisAlignment.spaceBetween
          ,children: [
          Image.network(article.img[0]["url"]),
          Text(article.title,style: TextStyle(color: Colors.red,fontSize: 22), textDirection: TextDirection.rtl,),
          Text(article.describtion, textDirection: TextDirection.rtl,style: TextStyle( fontSize: 15)),
          Text(article.content, textDirection: TextDirection.rtl,style: TextStyle( fontSize: 15)),
          Text(article.publishdate, textDirection: TextDirection.rtl,style: TextStyle( fontSize: 15)),
          Text(article.source+":مصدر الخبر"),
          RaisedButton(onPressed: (){
  print(article.url);
            launchInBrowser(article.url).then((value) => print("ok")).catchError((e){


              print("cant");
            });

          },child: Text("الذهاب الى مصدر الخبر"),)
        



        ],),
      ),
      
    );
  }
}