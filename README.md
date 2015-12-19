# Ruby初級者向けレッスン 56回
## ブロック

### 演習問題 1
0 から 9 までの数値をもつ配列 a がある。
```ruby
a = (0..9).to_a   # => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
```

* 各要素を順番に表示しよう。[回答例](https://github.com/higaki/learn_ruby_kansai_70/blob/master/ex1-1.rb)
* 各要素を文字列にした配列を作ろう。[回答例](https://github.com/higaki/learn_ruby_kansai_70/blob/master/ex1-2.rb)
* 各要素を 2倍した値を持つ配列を作ろう。[回答例](https://github.com/higaki/learn_ruby_kansai_70/blob/master/ex1-3.rb)
* 全要素の合計値を計算しよう。[回答例](https://github.com/higaki/learn_ruby_kansai_70/blob/master/ex1-4.rb)

### 演習問題 2
0 から 9 までの数値をもつ配列 a がある。
```ruby
a = [*0..9]       # => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
```
奇数の要素だけを持つ配列を作ろう。
ただし `odd?` メソッドは使用禁止。  
[回答例](https://github.com/higaki/learn_ruby_kansai_70/blob/master/ex2.rb)

### 演習問題 3
`Enumerable#map` を自作してみよう。
```ruby
module Enumerable
  def my_map
    ......
  end
end
```
ただし `Enumerable#map` と `Enumerable#map!` は使用禁止。  
[回答例](https://github.com/higaki/learn_ruby_kansai_70/blob/master/ex3.rb)
