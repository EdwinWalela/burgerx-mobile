class CartItem {
  String id;
  String thumb;
  String name;
  int price, quantity;

  CartItem({this.id, this.name, this.price, this.quantity, this.thumb});

  CartItem.fromDB(Map<String, dynamic> parsedJson) {
    id = parsedJson['_id'];
    thumb = parsedJson['thumb'];
    name = parsedJson['name'];
    price = parsedJson['price'];
    quantity = parsedJson['quantity'];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "_id": id,
      "thumb": thumb,
      "name": name,
      "price": price,
      "quantity": quantity
    };
  }
}
