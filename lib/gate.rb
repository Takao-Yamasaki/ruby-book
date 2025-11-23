class Gate
  STATIONS = [:umeda, :juso, :mikuni]
  FARE = [160, 190]

  # 初期化
  def initialize(name)
    @name = name
  end
  
  # 入場メソッド
  def enter(ticket)
    # stampメソッドを呼び出す
    ticket.stamp(@name)
  end

  # 出場メソッド
  def exit(ticket)
    fare = calc_fare(ticket)
    fare <= ticket.fare
  end

  # 運賃計算をするメソッド
  def calc_fare(ticket)
    from = STATIONS.index(ticket.stamp_at)
    to = STATIONS.index(@name)
    distance = to - from
    FARE[distance - 1]
  end
end
