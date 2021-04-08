import 'package:flutter/cupertino.dart';

import 'article.dart';
class Category {
    Category({
        this.id,
        this.name,
        this.publishedAt,
        this.createdAt,
        this.updatedAt,
        this.img,
        this.articles,
    });

    String id;
    String name;
    DateTime publishedAt;
    DateTime createdAt;
    DateTime updatedAt;
    List img;
    List<Article> articles;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        
        img: json["img"],
        articles: json["articles"].map((x) => Article.fromJson(x)).toList().cast<Article>(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        
        "img": img,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
    };
}
