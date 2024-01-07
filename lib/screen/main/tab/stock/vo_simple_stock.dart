class SimpleStock {
  final String name;

  SimpleStock(this.name);

  // json을 통해서 object를 생성하는 것이기 때문에 factory라는 키워드가 필요하다.
  // 가공할 수 있는 파라미터를 가지고, 필요한 생성자를 호출하여 그 객체를 돌려주는 역할
  factory SimpleStock.fromJson(dynamic json) {
    return SimpleStock(json['name']);
  }

  @override
  String toString() {
    return name;
  }
}
