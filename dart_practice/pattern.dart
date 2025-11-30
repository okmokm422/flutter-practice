class SomeClass {
  const SomeClass(this.x);
  final int x;
}


main() {
  print('================================================');
  print('Pattern');

  print('================================================');
  print('Pattern matching');
  final name = 'John';
  switch (name) { 
    case 'John':
      print('Hello, John!');
  }

  print('================================================');
  final record = ('cake', 300);
  final (name2, price) = record; // recordをnameとpriceに分解
  print('This $name2 is $price yen.');

  print('================================================');
  print('and(&&) or(||) equals(==) などの演算子はマッチング機能のみを持つ');
  final int statusCode = 200;
  final message = switch (statusCode) {
    >= 100 && < 200 => 'informational',
    >= 200 && < 300 => 'successfull',
    >= 300 && < 400 => 'redirection',
    >= 400 && < 500 => 'client error',
    >= 500 && < 600 => 'server error',
    _ => 'Unexpected status code',
  };
  print(message);

  print('================================================');
  print('一致判定');
  final variable = 'str';
  switch (variable) {
    case 123:
      print('123');
    case 'str':
      print('str');
    case false:
      print('false');
  }
  print('================================================');
  print('コレクションの一致判定ではリテラルにconst修飾子を付与する必要がある');
  final dynamic variable2 = const [1, 2, 3]; // case文がconstなので、マッチするにはvariable2もconstでなければならない
  switch (variable2) {
    case const[1, 2, 3]:
      print('list');
    case const{1, 2, 3}:
      print('set');
    case const{'key': 0}:
      print('map');
    default:
      print('not list, set, map');
  }
  print('================================================');
  print('constやstaticを付与した定数');
  final double variable3 = double.maxFinite; // 最大の有限値
  switch (variable3) {
    case double.maxFinite:
      print('double.maxFiniteにマッチ！');
  }

  print('================================================');
  print('マッチングと分解宣言の2つの機能を持つパターン');

  print('---...演算子とList---');
  final [a, b, ..., c] = [1, 2, 3, 4, 5];
  print('a: $a, b: $b, c: $c');

  print('---Map---');
  // 代入先の変数名とマッチングするキーを指定
  // { キー: 変数名 }の形式で、キーに対応する値を変数に代入
  final { 200: successful, 404: notFound } = { 
    // キーと値のペアを指定
    200: 'OK', // 200のキーに対応する値をsuccessfulに代入
    404: 'Not Found', // 404のキーに対応する値をnotFoundに代入
    500: 'Internal Server Error', // このキーはマッチしないので、無視される
  };
  print('200 -> $successful, 404 -> $notFound');

  print('---Record---');
  final record2 = (name: 'cake', price: 300);
  // 全ての構造が一致している場合は、マッチングする
  final (name: n, price: p) = record2;

  print('---Object---');
  final someInstance = SomeClass(123);
  final SomeClass(x: number) = someInstance;
  print('x = $number');

  print('---for-in文での分解宣言---');
  final sweets = [
    (name: 'cake', price: 300),
    (name: 'dango', price: 250),
  ];

  for (final (:name, :price) in sweets) {
    print('name = $name, price = $price');
  }

  print('---Mapのループ---');
  // MapはIterableのサブクラスではないので、for-in文ではループできない
  // 代わりにentriesを利用する
  final map = {
    200: 'OK',
    404: 'Not Found',
    500: 'Internal Server Error',
  };

  for (var MapEntry(key: key, value: value) in map.entries) {
    print('code: $key, $value');
  }

  print('================================================');
  print('パターンの補助構文');

  print('---キャスト---');
  final List<Object> list = [0, 'one'];
  final [number2 as int, str2 as String] = list;
  print('number2 = $number2, str2 = $str2');

  print('---nullチェック---');
  int? code = null;
  switch (code) {
    // 変数名の後ろに?を付与すると、nullチェックを行う
    // whenと組み合わせて、nullでない場合のみ更に条件を加える
    case final i? when i >= 0:
      print('i = $i');
    default:
      print('code is null or negative');
  }

  print('---nullアサーション---');
  int? code2 = 1;
  switch (code2) {
    // 変数名の後ろに!を付与すると、nullの場合はエラーになる
    case final i! when i>= 0:
      print('i = $i');
    default:
      print('code2 is negative');
  }

  print('---ワイルドカード---');
  final record3 = ('cake', 300);
  // _はワイルドカードとして、値を無視する
  final (name3, _) = record3;
  print('name3 = $name3');

}