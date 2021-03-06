# Mac 環境設定

## 対象バージョン

MacOS 10.12 Sierra

## 作業ログ

1. システム環境設定
  - 一般
    - メニューバーと Dock を暗くする: チェック
  - デスクトップとスクリーンセーバ
    - スクリーンセーバ
      - スライドパネル
    - ホットコーナー
      - 左下: デスクトップ
      - 右下: スクリーンセーバを開始する
  - Dock
    - 画面上の位置: 左
    - ウィンドウをアプリケーションにしまう: チェック
    - Dock を自動的に隠す/表示: チェック
  - Mission Control
    - ウィンドウをアプリケーションごとにグループ化: チェック
  - セキュリティとプライバシー
    - 一般
      - スリープとスクリーンセーバの解除にパスワードを要求: 開始後1分
  - キーボード
    - キーボード
      - キーのリピート: 最速
      - リピート入力認識までの時間: 最短
    - 修飾キー
      - Caps Lock: Control
    - Bluetooth キーボードを設定
      - 適切に設定する
    - ユーザ辞書
      - 先頭を自動的に大文字にする: 切る
      - スペースバーを2回押してピリオドを入力: 切る
    - ショートカット
      - Spotlight
        - Spotlight 検索を表示: 切る
  - トラックパッド
    - ポイントとクリック
      - タップでクリック: チェック
    - その他のジェスチャ
      - フルスクリーンアプリケーション間をスワイプ: 4本指で左右にスワイプ
      - Mission Control: チェック
      - アプリケーションExpose: チェック
      - Launchpad: 切る
      - デスクトップを表示: 切る
  - App Store
    - アプリケーションアップデートをインストール: チェック
  - アクセシビリティ
    - キーボード
      - 複合キーを有効にする: チェック
        - オプション
          - 修飾キーが設定されたときにビープ音を鳴らす: 切る
    - マウスとトラックパッド
      - トラックパッドオプション
        - ドラッグを有効にする: 3本指のドラッグ
  - 日付と時刻
    - 時計
      - 日付を表示: チェック
2. ターミナル
  - Homebrew
    - `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
3. その他
  - Google 日本語入力でスペースをいつでも半角にする
    - ステータスバーにある Google 日本語入力の入力モードから「環境設定」
    - スペースの入力: 半角
  - スクリーンショットの影を消し、任意のディレクトリに保存する
```sh
mkdir ~/Documents/screencaptures
defaults write com.apple.screencapture disable-shadow -boolean true
defaults write com.apple.screencapture location ~/Documents/screencaptures/
killall SystemUIServer
```
