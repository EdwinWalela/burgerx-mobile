class FoodItem {
  String thumb;
  String name;
  int price;
  double stars;
  String ingredients;

  FoodItem(this.thumb, this.name, this.price, this.stars, this.ingredients);

  FoodItem.fromJson(parsedJson) {
    thumb = parsedJson['thumb'];
    name = parsedJson['name'];
    price = parsedJson['price'];
    stars = parsedJson['stars'];
    ingredients = parsedJson['ingredients'];
  }
}
