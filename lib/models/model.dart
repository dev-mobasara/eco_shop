class Model {
  Model({
    required this.id,
    required this.price,
    required this.name,
    required this.desc,
    required this.color,
    required this.image,
  });

  final int id;
  final int price;
  final String name;
  final String desc;
  final String color;
  final String image;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        id: json['id'],
        price: json['price'],
        name: json['name'],
        desc: json['desc'],
        color: json['color'],
        image: json['image'],
      );
}
