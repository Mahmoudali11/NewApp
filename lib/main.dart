import 'package:flutter/material.dart';
import 'package:newsapp/articleofcategory.dart';
import 'package:newsapp/model/article.dart';
import 'package:newsapp/model/category.dart';
import 'dbhelper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HttpHelper m = HttpHelper();
  var urlimg = "";
  Image img;
  List<Category> list = [];
  Future getData() async {
    print("jhb");
    list = await m.getCategory();

    //print("7777777"+list[0].img[0]["url"]);
     
    //print("fvdv"+na);
    img = Image.network(" $urlimg");
//Future.delayed(Duration(seconds:0));
    setState(() {
      list = list;
      urlimg = urlimg;
      img = img;
    });
  }

  @override
  void initState() {
     getData();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    //
    //
   

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.width;

    final w = h / 2;

    return Scaffold(
        appBar: AppBar(
          //http://10.0.2.2:1337/uploads/$na.jpg
          title: Text("اهم الاخبار"),
          centerTitle: true,
        ),
        body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            urlimg = list[index].img[0]["formats"]["small"]["url"];
            List<Article> article=list[index].articles;

            img = Image.network("$urlimg");

            return GestureDetector(
              onTap: (){

                Navigator.push(context, MaterialPageRoute(builder: (context){
                  
                  return ArticleOfCategort(article:article ,cn:list[index].name);
                }));
              },
                          child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(
                    "${list[index].name}",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  width: w,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: img.image, fit: BoxFit.fill)),
                ),
              ),
            );
          },
          itemCount: list.length,
        ));
  }
}
