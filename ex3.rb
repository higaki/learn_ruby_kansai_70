# Enumerable#map を自作してみよう。

module Enumerable
  def my_map
    unless block_given?
      # ブロックがもらえなければ Enumerator を返す
      to_enum __callee__
    else
      # 空の Array を用意し
      inject [] do |result, item|
        # ブロックの評価結果を追加する
        result << yield(item)
      end
    end
  end
end

if $0 == __FILE__
  require 'test/unit'
  class TestMyMap < Test::Unit::TestCase
    def setup
      @array = [*0..9]
    end

    def test_with_block
      assert_equal @array.map{|i| i * 2}, @array.my_map{|i| i * 2}
    end

    def test_with_proc
      assert_equal @array.map(&:to_s), @array.my_map(&:to_s)
    end

    def test_without_block
      actual = @array.my_map
      @array.each do |expected|
        assert_equal expected, actual.next
      end
      assert_raise StopIteration do
        actual.next
      end
    end
  end

  class TestMyMapByEmpty < Test::Unit::TestCase
    def setup
      @array = []
    end

    def test_with_block
      assert_equal [], @array.my_map{|i| i * 2}
    end

    def test_with_proc
      assert_equal [], @array.my_map(&:to_s)
    end

    def test_without_block
      assert_raise StopIteration do
        @array.my_map.next
      end
    end
  end
end
# >> Loaded suite -
# >> Started
# >> ......
# >> 
# >> Finished in 0.001017 seconds.
# >> ------
# >> 6 tests, 16 assertions, 0 failures, 0 errors, 0 pendings, 0 omissions, 0 notifications
# >> 100% passed
# >> ------
# >> 5899.71 tests/s, 15732.55 assertions/s
