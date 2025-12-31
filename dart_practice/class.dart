class Point {

  int x = 0;
  int y = 0;

}

class Point2 {

  // コンストラクタ
  Point2(int xPosition, int yPosition): x = xPosition, y = yPosition;

  int x = 0;
  int y = 0;

}

class Point3 {

  // コンストラクタを宣言し、引数で受け取った値をフィールドに代入する糖衣構文
  Point3(this.x, this.y);

  // インスタンス変数の宣言
  int x;
  int y;

}

class Point4 {
  // :（初期化リスト）でパラメータのアサーションを記述できる
  Point4(this.x, this.y): assert(x >= 0), assert(y >= 0);
  final int x;
  final int y;
}

// constantコンストラクタ
// コンストラクタをコンパイル時に評価して、コンパイル時定数として扱うためのもの
// コンストラクタにconstキーワードを付与する
class Point5 {
  const Point5(this.x, this.y);
  // インスタンス変数は再代入できないfinalキーワードを付与する
  final int x;
  final int y;
}

final point1 = const Point5(1, 2); // constantコンストラクタの前にconstキーワードを付与　（コンパイル時定数）
const point2 = Point5(1, 2); // const変数に代入（コンパイル時定数）
final point3 = Point5(1, 2); // final変数に代入（実行時定数）


// 名前付きコンストラクタ
class Point6 {
  const Point6(this.x, this.y);
  const Point6.zero(): x = 0, y = 0; // 名前付きコンストラクタ zero()を宣言
  final int x;
  final int y;
}

// コンストラクターから自クラスの別のコンストラクタを呼び出す
class Point7 {
  const Point7(this.x, this.y);
  const Point7.zero(): this(0, 0); // 名前のないコンストラクタを呼び出す
  final int x;
  final int y;

}

// factoryコンストラクタ
class UserData {
  static final Map<int, UserData> _cache = {};

  // プライベートな名前なしコンストラクタ
  UserData._();

  //　UserDataクラスの名前付きコンストラクタ fromCache()
  factory UserData.fromCache(int userId) {
    // キャッシュを探す
    final cache = _cache[userId];
    if (cache != null) {
      // キャッシュがある場合はそれを返す
      return cache;
    }
    // キャッシュがなかったので新しいインスタンスを生成して返す
    final newInstance = UserData._();
    _cache[userId] = newInstance;
    return newInstance;
  }
  
}



main() {
  // constコンストラクタを使うと、同じ値のインスタンスは共有され、メモリ効率が良い
  print('point1 == point2: ${point1 == point2}');
  print('point1 == point3: ${point1 == point3}');
}
