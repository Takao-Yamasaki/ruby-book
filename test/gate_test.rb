######################
# 実行方法
# ruby test/gate_test.rb
######################
require 'minitest/autorun'
require_relative '../lib/gate'
require_relative '../lib/ticket'

class GateTest < Minitest::Test
  # 初期化
  def setup
    @umeda = Gate.new(:umeda)
    @juso = Gate.new(:juso)
    @mikuni = Gate.new(:mikuni)
  end
  
  def test_umeda_to_juso
    ticket = Ticket.new(160)
    @umeda.enter(ticket)
    # 期待値: 出場できるので、trueとなる
    assert @juso.exit(ticket)
  end

  # 梅田から三国まで運賃が不足しているとき
  def test_umeda_to_mikuni_when_fare_is_not_enough
    ticket = Ticket.new(160)
    @umeda.enter(ticket)
    # 期待値: 出場できないので、falseとなる
    refute @mikuni.exit(ticket)
  end

  # 梅田から三国まで運賃が足りているとき
  def test_umeda_to_mikuni_when_fare_is_enough
    ticket = Ticket.new(190)
    @umeda.enter(ticket)
    assert @mikuni.exit(ticket)
  end

  # 十三から三国まで運賃が足りているとき
  def test_mikuni_to_juso
    ticket = Ticket.new(160)
    @juso.enter(ticket)
    assert @mikuni.exit(ticket)
  end
end
