class Product {
  final String id;
  final String name;
  final double price;
  final String image; // using emoji for simplicity
  final String desc;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.desc,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        price: (json['price'] as num).toDouble(),
        image: json['image'],
        desc: json['desc'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'image': image,
        'desc': desc,
      };
}
