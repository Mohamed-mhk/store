class Product {
  final String title;
  final String mainImg;
  final String description;
  //final String publisherName;
  final double rating;
  final int price;
  Product({
    required this.title,
    required this.mainImg,
    required this.description,
    // required this.publisherName,
    required this.rating,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        title: json["title"],
        mainImg: json["mainImg"],
        description: json["description"],
        //  publisherName: json["publisherName"],
        rating: json["rating"],
        price: json["price"]);
  }
}
