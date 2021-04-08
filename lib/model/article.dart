import 'package:flutter/cupertino.dart';

import 'category.dart';
class Article {
    Article({
        this.id,
        this.title,
        this.source,
        this.describtion,
        this.url,
        this.publishdate,
        this.content,
        this.category,
        
        this.img,
    });

    String id;
    String title;
    String source;
    String describtion;
    String url;
    String publishdate;
    String content;
    String category;
   
    List img;

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json["id"],
        title: json["title"],
        source: json["source"],
        describtion: json["describtion"],
        url: json["url"],
        publishdate: json["publishdate"],
        content: json["content"],
        category: json["category"],
        
        img: json["img"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "source": source,
        "describtion": describtion,
        "url": url,
        "publishdate":publishdate,
        "content": content,
        "category": category,
        
        "img": img,
    };
}