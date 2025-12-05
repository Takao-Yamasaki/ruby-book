######################
# 実行方法
# ruby test/rainbowable_test.rb 
######################
require 'minitest/autorun'
require_relative '../lib/rainbowable'

class RainbowableTest < Minitest::Test
  def test_rainbow 
     # モジュールが参照できることを確認する
    assert Rainbowable
  end
end
