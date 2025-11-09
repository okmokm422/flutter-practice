// ジェネリクス
// 型をパラメータ化し、特定の型に依存しない汎用的な実装
final List<int> intList = [0, 1, 2]; // int型のリスト
final stringList = <String>['a', 'b', 'c']; // String型のリスト

// ジェネリクスクラス
// Tが型のパラメータ
class Foo<T> {
    
    // フィールド_valueの型をTにする
    T _value;
    // コンストラクタの省略記法
    Foo(this._value);
    // 以下と同じ意味
    // Foo(T value) {
    // this._value = value;
    // }
    
    T getValue() {
        return _value;
    }

}

// ジェネリクス関数
// T?はT型かnullを返すことを示す
T? firstOrNull<T>(List<T> list) {
    if (list.isEmpty) {
        return null;
    }
    return list[0];
}

void main() {
    final intFoo = Foo(3);
    print(intFoo.getValue());

    final stringFoo = Foo('hoge');
    print(stringFoo.getValue());

    final list1 = [1, 2, 3];
    print(firstOrNull(list1));

    final list2 = <String>[];
    print(firstOrNull(list2));
}