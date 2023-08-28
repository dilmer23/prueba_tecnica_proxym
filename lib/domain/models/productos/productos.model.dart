// To parse this JSON data, do
//
//     final productos = productosFromJson(jsonString);
import 'dart:convert';

Productos productosFromJson(String str) => Productos.fromJson(json.decode(str));

String productosToJson(Productos data) => json.encode(data.toJson());

class Productos {
    List<Menu> menu;
    List<Product> products;

    Productos({
        required this.menu,
        required this.products,
    });

    factory Productos.fromJson(Map<String, dynamic> json) => Productos(
        menu: List<Menu>.from(json["menu"].map((x) => Menu.fromJson(x))),
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "menu": List<dynamic>.from(menu.map((x) => x.toJson())),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Menu {
    int id;
    String icon;
    int productId;
    String redirectTo;

    Menu({
        required this.id,
        required this.icon,
        required this.productId,
        required this.redirectTo,
    });

    factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        id: json["id"],
        icon: json["icon"],
        productId: json["productId"],
        redirectTo: json["redirectTo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "icon": icon,
        "productId": productId,
        "redirectTo": redirectTo,
    };
}

class Product {
    int id;
    String path;
    String image;
    String title;
    String longDescription;
    String shortDescription;

    Product({
        required this.id,
        required this.path,
        required this.image,
        required this.title,
        required this.longDescription,
        required this.shortDescription,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        path: json["path"],
        image: json["image"],
        title: json["title"],
        longDescription: json["longDescription"],
        shortDescription: json["shortDescription"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "path": path,
        "image": image,
        "title": title,
        "longDescription": longDescription,
        "shortDescription": shortDescription,
    };
}
