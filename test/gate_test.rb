require 'minitest/autorun'
require_relative '../lib/gate'

class GateTest < Minitest::Test
  def test_gate
    # Gateオブジェクトが作成できることを確認
    assert Gate.new
  end
end
