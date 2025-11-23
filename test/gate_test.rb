######################
# 実行方法
# ruby test/gate_test.rb
######################
require 'minitest/autorun'
require_relative '../lib/gate'
require_relative '../lib/ticket'

class GateTest < Minitest::Test
  def test_gate
    umeda = Gate.new(:umeda)
    juso = Gate.new(:juso)

    ticket = Ticket.new(160)
    umeda.enter(ticket)
    # 期待値: 出場できるので、trueとなる
    assert juso.exit(ticket)
  end
end
