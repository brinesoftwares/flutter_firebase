class FoodModel {
  String food;
  String price;

  FoodModel({this.food, this.price});

  FoodModel.fromJson(Map<String, dynamic> json) {
    food = json['food'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['food'] = this.food;
    data['price'] = this.price;
    return data;
  }
}
