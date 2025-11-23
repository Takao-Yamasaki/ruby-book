class Ticket
  # Getterを追加
  attr_reader :fare, :ticket

  def initialize(fare)
    @fare = fare
  end
  
  # 駅名を保存する
  def stamp(name)
    # インスタンス変数に駅名を格納する
    @stamp_at = name
  end
  
  # 駅名を取得する
  def stamp_at
    @stamp_at
  end
end
