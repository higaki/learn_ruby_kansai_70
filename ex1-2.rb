a = (0..9).to_a     # => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

# 各要素を文字列にした配列を作ろう。
a.map{|i| i.to_s}
                    # => ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
