# レポジトリ概要

- Flutterの開発練習用レポジトリ
- 書籍([Flutter実践開発 ── iPhone／Android両対応アプリ開発のテクニック](https://amzn.asia/d/hNnVHlu))を利用した練習コードです。

# brew install
[direnv]()


# Flutterのインストール


- [公式の手順](https://docs.flutter.dev/get-started/quick#install)

## VSCodeの拡張機能の追加
- [Dart-Code.flutter](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter)

## 新規プロジェクトの作成
1. `Cmd`+`Shift`+`p`
2. `Flutter`で検索
3. `Flutter: New Project`を選択
4. プロジェクト直下にインストール


## パスの追加
プロジェクト直下にインストールしたFlutter SDKをパスに追加する。
プロジェクト内だけでパスを追加したいので、direnvを使う。

プロジェクト直下に.envrcを作成し、以下を記載する。
```sh
export PATH="/flutter/bin:$PATH"
```

```sh
direnv allow
```

## Rosetta2のインストール
```sh
sudo softwareupdate --install-rosetta --agree-to-license
```
パスワードを求められるので、ユーザのパスワードを入力→Enter

## Flutterがインストールできたことの確認
```
flutter --version
```

# プラットフォームごとの環境構築

開発環境の情報を出力
```sh
flutter doctor
```
出力結果
```sh
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.35.6, on macOS 15.7.1 24G231 darwin-arm64, locale ja-JP)
[!] Android toolchain - develop for Android devices (Android SDK version 35.0.1)
    ! Some Android licenses not accepted. To resolve this, run: flutter doctor --android-licenses
[!] Xcode - develop for iOS and macOS (Xcode 26.0.1)
    ! iOS 26.0 Simulator not installed; this may be necessary for iOS and macOS development.
      To download and install the platform, open Xcode, select Xcode > Settings > Components,
      and click the GET button for the required platform.

      For more information, please visit:
        https://developer.apple.com/documentation/xcode/installing-additional-simulator-runtimes
[✓] Chrome - develop for the web
[✓] Android Studio (version 2024.3)
[✓] VS Code (version 1.104.0)
[✓] Connected device (2 available)
[✓] Network resources
```