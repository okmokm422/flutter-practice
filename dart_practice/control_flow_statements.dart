void main() {
  // if文
  final now = DateTime.now();
  if (now.hour >= 6 && now.hour < 13) {
    print("Good morning!");
  } else if (now.hour >= 13 && now.hour < 18) {
    print("Good afternoon!");
  } else {
    print("Good evening!");
  }

  // if-case文
  final (String?, int?) response = ("OK", 200);
  // 分解代入
  if (response case (String message, int statusCode)) {
    print("Response: message = $message, statusCode = $statusCode");
  } else {
    print("No response received.");
  }

  // when
  final (String?, int?) response2 = ("OK", 200);
  if (response2 case (String message, int statusCode) when statusCode == 200) {
    // messageが非nullかつ、statusCodeが200の時のみ、メッセージを出力
    print("Response: message = $message, statusCode = $statusCode");
  } else if (response2 case (String message, int statusCode)) {
    print("No response received.");
  } 

  // switch文
  final String color = "red";
  switch (color) {
    case "red":
      print("The color is red.");
      break;
    case "green":
      print("The color is green.");
      break;
    case "blue":
      print("The color is blue.");
      break;
    case "black":
      break; // switch文を抜ける
    default:
      throw 'Unexpected color'; // エラーを投げる
  }

  final String color2 = "red";
  switch (color2) {
    case "red":
      print("The color is red.");
      continue other; // otherラベルにジャンプ
      break;
    case "blue`":
      print("The color is blue.");
    other: // ジャンプするotherラベル
    case "green": // ここはチェックされないで無条件に実行される
      print("The color is green.");
      // breakがないので、以下のcaseもチェックされる
    case "black":
      throw 'Unexpected color';
  }

  final int? statusCode = null;
  switch (statusCode) {
    case (int statusCode) when 100 <= statusCode && statusCode < 200:
      print("informational");
    case (int statusCode) when 200 <= statusCode && statusCode < 300:
      print("successfull");
    case (int statusCode) when 300 <= statusCode && statusCode < 400:
      print("redirection");
    case (int statusCode) when 400 <= statusCode && statusCode < 500:
      print("client error");
    case (int statusCode) when 500 <= statusCode && statusCode < 600:
      print("server error");
    case (null):
      print("no response received.");
    default:
      print('Unexpected status code');
  }

  // 式としてのswitch文
  final int statusCode3 = 100000;
  final message = switch ( statusCode3 ) {
    >= 100 && < 200 => "informational", // statusCode3 >= 100 && < statusCode3 < 200と同じ意味
    >= 200 && < 300 => "successfull",
    >= 300 && < 400 => "redirection",
    >= 400 && < 500 => "client error",
    >= 500 && < 600 => "server error",
    _ => "Unexpected status code", // _はデフォルトのパターン
  };
  print(message);

  //while文
  print("================================================");
  print("while文");
  final flag = true;
  while (flag) {
    print("flag is true");
    break;
  }

  // do-while文
  print("================================================");
  print("do-while文");
  int count = 0;
  do {
    print("count is $count");
    count++;
    if (count == 10) {
      print("exit loop");
      break;
    }
  } while (flag);

  // breakとcontinue
  print("================================================");
  print("breakとcontinue");
  for (int i = 0; i < 10; ++i) { // i += 1と同じ意味
    if (i % 2 == 0) {
      continue; // 偶数の場合はスキップ
    }
    if (i > 6) {
      break; // 7以上の場合はループを抜ける
    }
    print("index = $i");
  }

}