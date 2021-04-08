import 'package:flutter/material.dart';
import 'package:newsapp/model/article.dart';
import 'package:newsapp/newsdetails.dart';

class ArticleOfCategort extends StatefulWidget {
  final List<Article> article;
    var cn;
  ArticleOfCategort({this.article,this.cn});
  @override
  _ArticleOfCategortState createState() =>
      _ArticleOfCategortState(article: article,cn: cn);
}

class _ArticleOfCategortState extends State<ArticleOfCategort> {
  List<Article> article;
  var na = "";
  Image img;
  String cn="";

  _ArticleOfCategortState({this.article,this.cn});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var heiht = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(cn),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 2.0,
          mainAxisSpacing: 2,
        ),
        itemBuilder: (context, index) {
          if (article[index].img.length > 0) {
            na = article[index].img[0]["formats"]["small"]["url"];

            img = Image.network(
              "$na",
              width: width / 3,
              height: heiht / 3,
              fit: BoxFit.fill,
            );
          } else {
            img = Image.asset(
              'asset/sport.jpg',
              width: width / 3,
              height: heiht / 3,
              fit: BoxFit.fill,
            );
          }

          return Container(
            alignment: Alignment.centerRight,
           
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                 return NewsDtails(article: article[index],);
                 }));
              },
              child: Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                     Expanded(child: img),
                  
                  Expanded(
                                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          article[index].title,
                          style: TextStyle( color: Colors.red),
                        ),
                        Text(article[index].publishdate,
                            style: TextStyle(fontSize: 15, color: Colors.green)),
                        Text(article[index].describtion)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: article.length,
      ),
    );
  }
}
