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
// Vehicleという名前の列挙型を定義している。
// Comparableインターフェースを実装しており、Vehicleのインスタンス同士を比較できるようにしている。
// 比較にはcompareToメソッドを通して行われる。
enum Vehicle implements Comparable<Vehicle> {

    // car,bus,bicycle：列挙型(Vehicle)のインスタンスとして3つの車両が定義されている。
    // 各インスタンスにはタイヤの数、乗客数、１キロメートルあたりの二酸化炭素排出量というパラメータが設定されている。
    car(tires: 4, passengers: 5, carbonPerKilometer: 400),
    bus(tires: 6, passengers: 50, carbonPerKilometer: 800),
    bicycle(tires: 2, passengers: 1, carbonPerKilometer: 0);

    // コンストラクタ。
    // インスタンスが不変であることを示している。
    const Vehicle({
        required this.tires,
        required this.passengers,
        required this.carbonPerKilometer,
    });

    /// タイヤの数。
    final int tires;

    /// 乗客数。
    final int passengers;

    /// １キロメートルあたりの二酸化炭素排出量。
    final int carbonPerKilometer;

    // ゲッター(読み取り専用プロパティ)。
    // carbonFootprintは一人当たりの二酸化炭素排出量を乗客数でわり、それを四捨五入して整理して返す。
    int get carbonFootprint => (carbonPerKilometer / passengers).round();

    // ２輪車であるかどうかを判定するブール型のゲッター。
    // this == Vehicle.bicycle : 現在のVehicleインスタンスがbicycleであればtrueを返し、そうでなければfalseを返す。
    // つまり、このプロパティは自転車かどうかを判定する。
    bool get isTwoWheeled => this == Vehicle.bicycle;

    @override
    int compareTo(Vehicle other) => carbonFootprint - other.carbonFootprint;
}
```

### enumの使用方法

```dart
enum ButtonColor{
    red,
    green,
    blue,
}
```

### インスタンスへのアクセス

```dart
final buttonColor = ButtonColor.red;
if(buttonColor == Colors.red){
    print('success');
}
```

### インデックスの取得

各enum値にはindexゲッターがあり、enum宣言内の値の0から始まる値を返す。

```dart
assert(ButtonColor.red.index == 0);
assert(ButtonColor.green.index == 1);
assert(ButtonColor.blue.index == 2);
```

### 全ての値のリスト化

enumのvalues定数を使用すると、列挙された全ての値のリストを取得できる。

```dart
final List<ButtonColor> buttonColor = AppColor.value;
print(buttonColor);
print(buttonColor[2] == ButtonColor.blue)
```

### switch文での使用

enumをswitch文で使用すると、すべてのenum値を処理しなければ警告が表示される。

```dart
final buttonColorBlue = ButtonColor.blue;

switch(buttonColorBlue){
    AppColor.blue => 'success',
    AppColor.red => 'failure',
    AppColor.green => 'failure',
}
```

### 名前を取得

列挙された値の名前を取得するには、nameプロパティを使用する。

```dart
print(ButtonColor.red.name);
```

