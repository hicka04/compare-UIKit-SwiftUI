# compare-UIKit-SwiftUI
## サンプル
プラスボタンを押すとリストが1行増える

## 比較
### UIKit
* Viewの宣言と実際に表示される見た目の宣言がバラバラになりがち
  * UITableViewとUITableViewCell
* Viewの宣言とイベント処理内容がバラバラになりがち
  * ButtonとSelector
* AutoLayout難しい

### SwiftUI
* 上記問題解決
  * Viewは宣言したとおりに表示される
  * Viewの宣言と同時にイベント処理内容も宣言する
  * レイアウトの指定簡単
* 別の問題
  * iOS13以上じゃないと使えない
  * UIKitとSwiftUIの併用ができない(らしい)
    * iOS12以下ならUIKit、iOS13以上ならSwiftUIとかできない
    * つまりiOS13未満を切るしかない
    * いったい何年後…