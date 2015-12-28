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
      @fixture = [*0..9]
    end

    def test_with_block
      assert_equal @fixture.map{|i| i * 2}, @fixture.my_map{|i| i * 2}
    end

    def test_with_proc
      assert_equal @fixture.map(&:to_s), @fixture.my_map(&:to_s)
    end

    def test_without_block
      actual = @fixture.my_map
      @fixture.each do |expected|
        assert_equal expected, actual.next
      end
      assert_raise StopIteration do
        actual.next
      end
    end
  end

  class TestMyMapByHash < TestMyMap
    def setup
      @fixture = {matz: 50, dhh: 36}
    end

    def test_with_block
      super
    end

    def test_with_proc
      super
    end

    def test_without_block
      super
    end
  end

  class TestMyMapByEmpty < TestMyMap
    def setup
      @fixture = []
    end

    def test_with_block
      super
    end

    def test_with_proc
      super
    end

    def test_without_block
      assert_raise StopIteration do
        @fixture.my_map.next
      end
    end
  end
end

# >> Loaded suite -
# >> Started
# >> .........
# >> 
# >> Finished in 0.001736 seconds.
# >> ------
# >> 9 tests, 21 assertions, 0 failures, 0 errors, 0 pendings, 0 omissions, 0 notifications
# >> 100% passed
# >> ------
# >> 5184.33 tests/s, 12096.77 assertions/s
