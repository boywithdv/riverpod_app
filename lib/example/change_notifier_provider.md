
# ChangeNotifierProvider

https://riverpod.dev/docs/providers/change_notifier_provider

ChangeNotifierProviderは、Riverpodで、ChangeNotifierのリスニングと公開に使われるプロバイダです。
しかし、Riverpodでは ChangeNotifierProvider の使用は推奨されていません。

これは主に以下の理由からです：

- package:provider からの移行を簡単にするため。
- 可変状態（mutable state）をサポートするため。ただし、イミュータブル（不変）な状態が推奨されています。

なのでできるだけ**NotifierProvider** を使用することが推奨されます。
ChangeNotifierProvider は、絶対に可変状態が必要な場合にのみ検討してください。

## わかりやすくまとめると

- **基本的には使わない方が良い**：ChangeNotifierProviderは推奨されておらず、代わりに NotifierProvider を使うのが良いです。
- **使う時は注意**：ChangeNotifierProvider を使う場合、パフォーマンスに影響する可能性があるため、注意が必要です。
- **可変状態 vs イミュータブル状態**：可変状態（ChangeNotifierProvider）よりも、不変の状態の方が管理が簡単で、パフォーマンスが向上する場合があります。