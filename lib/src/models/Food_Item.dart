class FoodItem {
  String id;
  int __v;
  String thumb;
  String name;
  int price;
  double stars;
  String ingredients;

  FoodItem(this.id, this.__v, this.thumb, this.name, this.price, this.stars,
      this.ingredients);

  FoodItem.fromJson(parsedJson) {
    __v = parsedJson['__v'];
    id = parsedJson['_id'];
    thumb = parsedJson['thumb'];
    name = parsedJson['name'];
    price = parsedJson['price'];
    stars = parsedJson['stars'].toDouble();
    ingredients = parsedJson['ingredients'];
  }
}
