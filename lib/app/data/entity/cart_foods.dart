class CartFoods {
  String id;
  String name;
  String image;
  String price;
  String orderQuantity;
  String username;

  CartFoods({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.orderQuantity,
    required this.username,
  });

  factory CartFoods.fromJson(Map<String, dynamic> json) {
    return CartFoods(
        id: json["sepet_yemek_id"] as String,
        name: json["yemek_adi"] as String,
        image: json["yemek_resim_adi"] as String,
        price: json["yemek_fiyat"] as String,
        orderQuantity: json["yemek_siparis_adet"] as String,
        username: json["kullanici_adi"] as String);
  }
}
