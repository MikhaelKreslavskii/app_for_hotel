class Room {
  Room({
    required this.id,
    required this.name,
    required this.price,
    required this.pricePer,
    required this.peculiarities,
    required this.imageUrls,
  });
  late final int id;
  late final String name;
  late final int price;
  late final String pricePer;
  late final List<String> peculiarities;
  late final List<String> imageUrls;

  Room.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    pricePer = json['price_per'];
    peculiarities = List.castFrom<dynamic, String>(json['peculiarities']);
    imageUrls = List.castFrom<dynamic, String>(json['image_urls']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['price'] = price;
    _data['price_per'] = pricePer;
    _data['peculiarities'] = peculiarities;
    _data['image_urls'] = imageUrls;
    return _data;
  }
}
