class Gate
  # 初期化
  def initialize(name)
    @name = name
  end
  
  # 入場メソッド
  def enter(ticket)
    true
  end

  # 出場メソッド
  def exit(ticket)
    true
  end
end
