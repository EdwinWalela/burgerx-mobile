class FoodItem {
  String _id;
  int __v;
  String thumb;
  String name;
  int price;
  double stars;
  String ingredients;

  FoodItem(this.thumb, this.name, this.price, this.stars, this.ingredients);

  FoodItem.fromJson(parsedJson) {
    __v = parsedJson['__v'];
    _id = parsedJson['_id'];
    thumb = parsedJson['thumb'];
    name = parsedJson['name'];
    price = parsedJson['price'];
    stars = parsedJson['stars'].toDouble();
    ingredients = parsedJson['ingredients'];
  }
}
