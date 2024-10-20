# Enum

## DartでのEnumの定義

### シンプルなEnum

dartでenumを定義する方法は以下のようになる。

```dart
enum Weekday{
    monday,
    tuesday,
    wednesday,
    thursday,
    friday,
    saturday,
    sunday
}
```

### enhanced enum

Dartでは以下をenumとして宣言することもできる。

- フィールド
- メソッド
- constコンストラクタ

#### enhanced enumの要件

- インスタンス変数はfinalにする。
- 全ての生成コンストラクタは定数である必要がある。
- 他のクラスを拡張することはできない。
- Factoryコンストラクタはenumインスタンスの１つだけを返す。
- index , hashCode , 等価演算子(==)をオーバーライドすることはできない。
- valuesという名前のメンバーは列挙型で宣言できない。(valuesゲッターと統合するため)

```dart
enum Vehicle implements Comparable<Vehicle> {
  car(tires: 4, passengers: 5, carbonPerKilometer: 400),
  bus(tires: 6, passengers: 50, carbonPerKilometer: 800),
  bicycle(tires: 2, passengers: 1, carbonPerKilometer: 0);

  const Vehicle({
    required this.tires,
    required this.passengers,
    required this.carbonPerKilometer,
  });

  final int tires;
  final int passengers;
  final int carbonPerKilometer;

  int get carbonFootprint => (carbonPerKilometer / passengers).round();

  bool get isTwoWheeled => this == Vehicle.bicycle;

  @override
  int compareTo(Vehicle other) => carbonFootprint - other.carbonFootprint;
}
```