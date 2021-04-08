
 
import 'package:http/http.dart' as http;
import 'model/category.dart';
import 'dart:convert' as convert;
import 'model/article.dart';
class HttpHelper{
  String apitoken="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYwNjk5YTI4OTFkMzJkMTYzODgyYTZmYiIsImlhdCI6MTYxNzU0MjY5MywiZXhwIjoxNjIwMTM0NjkzfQ.cxPnQ4RljxVV3JmFpyLl_o64UMM_TtgrOJ7XyqEGpMs";
 
  String url="https://mahmoudsnewsapp.herokuapp.com/categories";
  static final _h=HttpHelper._internal();
  HttpHelper._internal();
  factory HttpHelper(){


    return _h;
  }


  Future<List<Category>> getCategory() async{
        print("redr");

    var  response=await http.get(url,headers: {
      'Authorization': 'Bearer $apitoken'
    });
    print("redr");
//     if(response.statusCode==200){
// print("refused");
// //return null;

//     }
    var stringjson=response.body;
    var paresdj=convert.jsonDecode(stringjson);
    print(paresdj.toString());

    List<Category>cat=paresdj.map((e){
      return Category.fromJson(e);

    }).toList().cast<Category>();

return cat;





  }



}