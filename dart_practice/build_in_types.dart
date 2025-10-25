// 復習 finalとconstの違い
// final
// 実行時に評価される
// 変数の値を変更できる
// const
// コンパイル時に評価される
// クラス変数はconstで宣言できない（静的なクラス変数であれば宣言可能）

void main() {
  // int型
  // intクラスとして推論される整数リテラル
  final x = 1;
  final hex = 0xFF; // 16進数リテラル
  final exponent = 1e5; // 指数表記

  // double型
  final y = 1.1;
  final exponents = 1.4e5; // 指数表記

  // Stringクラス 文字列リテラル
  final str1 = 'Hello, Dart!';
  final str2 = "Hello, Dart!";

  final name = 'dart';
  final str3 = 'Hello, $name!';
  print('変数を文字列リテラルに代入した場合 \$');
  print(str3);
  print('--------------------------------');

  final str4 = 'Hello, ${name.toUpperCase()}';
  print('\${}の場合');
  print(str4);
  print('--------------------------------');

  final message1 = 'Hello, ''Dart!';
  print('文字列リテラルが自動的に連結された場合');
  print(message1);
  print('--------------------------------');

  final message2 = "Hello, "
  'Dart!';
  print('改行した文字列リテラルが自動的に連結された場合');
  print(message2);
  print('--------------------------------');

  final message3 = 'Hello, ' + 
  'Dart!';
  print('+演算子で文字列を連結した場合');
  print(message3);
  print('--------------------------------');

  // 複数行の文字列
  final message1_line_break = "<div>\n <p>Hello, Dart!</p>\n</div>";
  print('\\nで改行を含む文字列');
  print(message1_line_break);
  print('--------------------------------');

  final message2_line_break = """
<div>
 <p>Hello, Dart!</p>
</div>
""";
  print('トリプルクォートで複数行文字列');
  print(message2_line_break);
  print('--------------------------------');

  final message3_line_break = '''
<div>
 <p>Hello, Dart!</p>
</div>
''';
  print('トリプルシングルクォートで複数行文字列');
  print(message3_line_break);
  print('--------------------------------');

  // raw文字列リテラル
  final message1_raw = 'Hello, \n Dart!';
  print('改行あり文字列リテラル');
  print(message1_raw);
  print('--------------------------------');

  final message2_raw = r'Hello, \n Dart!';
  print('改行ありraw文字列リテラル');
  print(message2_raw);
  print('--------------------------------');

  // bool
  final flag1 = true;
  final flag2 = false;

  // list
  final list1 = [0, 1, 2, 3];
  // 末尾にカンマを付与したリスト
  final list2 = [0, 1, 2, 3,];
  // 型推論（変更可能なリスト）
  // finalは変数自体の再代入はできないが、オブジェクトの中身は変更可能
  final intList = [0, 1, 2, 3];
  print('List');
  print('List before add: $intList');
  intList.add(4);
  print('List after add: $intList');
  // List要素の型明示
  final list3 = <int>[0, 1, 2, 3];
  // 固定長リスト
  final baseList = [0, 1, 2, 3];
  // 固定長リストの新しいインスタンスを作成
  final fixedLengthList = List.unmodifiable(baseList);
  // 実行時エラーになる
  // fixedLengthList.add(4);

  // Set
  // 基本
  final set1 = {'Apple', 'Orange', 'Grape'};
  // 末尾にカンマを付与したSet
  final set2 = {'Apple', 'Orange', 'Grape',};
  // Setの型推論（型が同じであれば,addメソッドで要素を追加できる）
  final set3 = {'Apple', 'Orange', 'Grape'};
  // 型を明示
  final set4 = <String>{'Apple', 'Orange', 'Grape'};
  print('--------------------------------');
  // addFruit関数をmain内に移動
  void addFruit(String fruit) {
    set3.add(fruit);
  }
  print('Set before add: $set3');
  addFruit('Banana');
  print('Set after add: $set3');

  // Map
  final map1 = {
    200: 'OK',
    403: 'access forbidden',
    404: 'not found'
  };
  final map2 = {
    200: 'OK',
    403: 'access forbidden',
    404: 'not found', // 末尾にカンマを付与してもエラーにならない
  };
  final statusCodes = {
    200: 'OK',
    403: 'access forbidden',
    404: 'not found'
  };
  print('--------------------------------');
  print('Map');
  print('Map before add: $statusCodes');
  statusCodes[204] = 'No Content';
  print('Map after add: $statusCodes');
  // 型推論により、エラーになる
  // statusCodes['204'] = 'No Content';
  // Mapの型明示
  final statusCodes2 = <int, String>{
    200: 'OK',
    403: 'access forbidden',
    404: 'not found'
  };
  //{}の形式でオブジェクトを作成
  final setOrMap = {};
  print('setOrMap is Set: ${setOrMap is Set}');
  print('setOrMap is Map: ${setOrMap is Map}');

  // Record型
  // 複数の値を集約して不変の匿名型
  final record1 = (300, 'cake');
  final (int, String) record2 = record1;
  final record3 = (price: 300, name: 'cake');
  // Record型の型注釈
  // 型注釈では名前付きフィールドを中括弧で囲う
  final ({int price, String name}) record4 = (price: 300, name: 'cake');
  // 名前付きフィールドの記述順による比較
  final record5 = (price: 300, name: 'cake');
  final record6 = (name: 'cake', price: 300);
  print('--------------------------------');
  print('Record型');
  print('record5 == record6: ${record5 == record6}');
  // 中括弧で囲まない方法でフィールドに名前を付与
  final (int price, String name) record7 = (300, 'cake');
  final (int x, String y) record8 = (300, 'cake');
  print('record7: $record7');
  print('record8: $record8');
  print('record7 == record8: ${record7 == record8}');
  // 名前付きフィールドと位置フィールドの混在
  // 99のみが位置フィールドとして扱われる
  final record9 = (price: 300, name: 'cake', 99);
  // 型注釈では位置フィールドを先頭に記述する
  final (int count, {String name, int price})record11 = 
    (99, price: 300, name: 'cake');
  print('record11: $record11');
  print('record11.name: ${record11.name}');
  print('record11.price: ${record11.price}');
  print('record11.\$1: ${record11.$1}');

  // Objectクラス
  // 全てのスーパークラス
  // 型の異なる要素を持ったコレクションを扱う場合に使う
  final list = [
    0, 
    'abc',
    true,
  ];

  // dynamic型
  // コンパイル時に型チェックが行われない
  final List<dynamic> dynamicList = [
    0, 
    'abc',
    true,
  ];

}