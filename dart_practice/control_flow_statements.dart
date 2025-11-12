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
}