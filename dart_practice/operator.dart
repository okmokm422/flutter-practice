main() {
  print("""2 + 3: ${2 + 3}
2 - 3: ${2 - 3}
2 * 3: ${2 * 3}
5 / 2: ${5 / 2}
5 % 2: ${5 % 2}
""");

  int a;
  int b;
  
  a = 0;
  b = ++a;
  print("""前置インクリメント（aを1増やしてからbに代入）
a: $a, b: $b
""");
  
  a = 0;
  b = a++;
  print("""後置インクリメント（aをbに代入してから1増やす）
a: $a, b: $b
""");

  a = 0;
  b = --a;
  print("""前置デクリメント（aを1減らしてからbに代入）
a: $a, b: $b
""");

  a = 0;
  b = a--;
  print("""後置デクリメント（aをbに代入してから1減らす）
a: $a, b: $b
""");

  print("""比較演算子
2 == 2: ${2 == 2}
2 != 1: ${2 != 1}
10 > 2: ${10 > 2}
2 < 10: ${2 < 10}
5 >= 5: ${5 >= 5}
5 <= 5: ${5 <= 5}
""");

int a_ternary = 128;
int b_ternary = 256;
  print("""
三項演算子
a: $a_ternary, b: $b_ternary
a > b ? a : b => ${a_ternary > b_ternary ? a_ternary : b_ternary}
""");

// カスケード記法
final sb = StringBuffer()
..write("カスケード記法一回目")
..write("カスケード記法二回目")
..write("カスケード記法三回目");
print("""カスケード記法
sb => $sb
""");

// コレクションのオペレータ
// Spread演算子
final list1 = [0, 1, 2, 3];
print("""Spread演算子
list1 => $list1
[-1, ...list1] => ${[-1, ...list1]}
""");
// 制御構文演算子
final flag_true = true;
final flag_false = false;
final list_true = [0, 1, 2, if (flag_true) 3];
final list_false = [0, 1, 2, if (flag_false) 3];      
final list_for_1 = [1, 2, 3];
final list_for_2 = [0, for (var i in list_for_1) i * 2];
print("""制御構文演算子
flag_true => $flag_true
[0, 1, 2, if (flag_true) 3] => $list_true
flag_false => $flag_false
[0, 1, 2, if (flag_false) 3] => $list_false
list_for_1 => $list_for_1
[0, for (var i in list_for_1) i * 2] => $list_for_2
""");


}