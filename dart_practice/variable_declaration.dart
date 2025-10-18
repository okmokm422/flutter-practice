// 型宣言
int age1 = 0;
// 型推論
var age2 = 0;
// 定数
final int age3 = 37;
// age3 = 38; // エラー - final変数は変更不可
// 型推論 + 定数
final age4 = 37;
// コンパイル時定数
// コンパイル時に値が決まる定数であり、実行時に変更不可
const int age5 = 37;
// 型推論 + コンパイル時定数
const age6 = 37;
//　初期値の与え方
// 現在時刻の時が偶数か奇数かを判定
final flag = DateTime.now().hour.isEven;


addNumber(flag) {
final int number; // 宣言時に初期化しない

  if (flag) {

    number = 0;

  } else {

    number = 255;

  }

  print("flag: $flag");
  print("number: $number");
}

// 遅延初期化
// 宣言時に初期化しない
late String globalVariable;


main() {
  addNumber(flag);

  // 遅延初期化
  globalVariable = "Hello, World!";
  print("globalVariable: $globalVariable");
}