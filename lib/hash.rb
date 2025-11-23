######################
# ハッシュ
######################
# 実行方法
# ruby lib/hash.rb

# 空のハッシュのクラス名を確認する
# h = {}
# p h.class 

# ブロックの{}
# [1, 2, 3].each {|n| puts n}

# ハッシュリテラルの{}
currencies = {'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee'}
# 要素の追加
# currencies['italy'] = 'euro'
# p currencies
# 既存の値を上書きする
# currencies['japan'] = '円'
# p currencies
# 要素の取得
# p currencies['india']
# 存在しないキーを指定する(nilになる)
# p currencies['brazil'] 
# 要素の削除
# p currencies.delete('japan') # 削除した要素の値であるyenを返す
# p currencies
# p currencies.delete('italy') # nilを返す
# ブロックを渡すと見つからない時の戻り値を設定できる
# p currencies.delete('italy') { |key| "Not found: #{key}"} # "Not found: italy"

# ハッシュを使った繰り返し処理
# currencies.each do |key, value|
#   puts "#{key} : #{value}"
# end
# ブロックパラメータを1つにすると、配列に格納される
# currencies.each do |key_value|
#   puts key_value[0]
#   puts key_value[1]
# end

# 同値比較
# a = {'x' => 1, 'y' => 2, 'z' => 3}
# b = {'x' => 1, 'y' => 2, 'z' => 3}
# c = {'z' => 3, 'y' => 2, 'x' => 1}
# d = {'x' => 10, 'y' => 2, 'z' => 3}
# p a == b # キーと値が同一なのでtrue 
# p a == c # 並びが異なっていてもキーと値が同一なのでtrue
# p a == d # xの値が異なるので、false

# 要素の個数
# {}.size # 0
# {'x' => 1, 'y' => 2, 'z' => 3}.size # 3

# シンボル
# p :apple.class # Symbol
# p 'apple'.class # String

# 同じシンボルであれば、同一のオブジェクトIDを持つので、大量のデータを扱う場合にメモリ効率がよい
# p :apple.object_id # 1384988
# p :apple.object_id # 1384988
# p :apple.object_id # 1384988
# p 'apple'.object_id # 60
# p 'apple'.object_id # 80
# p 'apple'.object_id # 100

# 文字列は破壊的な変更
# string = 'apple'
# string.upcase!
# p string # "APPLE"

# シンボルはイミュータブルなので破壊的な変更が不可能
# symbol = :apple
# symbol.upcase! # undefined method `upcase!' for an instance of Symbol (NoMethodError)
# p symbol

# シンボルをハッシュのキーにする
# currencies = {:japan => 'yen', :us => 'doller', :india => 'ruppee'}
# p currencies[:japan]


# 状態や区分を管理するときには処理効率も可読性もいい
# status = :done

# case status
# when :todo
#   p 'これからやります'
# when :doing
#   p '今やっています'
# when :done
#   p 'もう終わりました'
# end

# ハッシュのキーにシンボルを使う
# currencies = {:japan => 'yen', :us => 'doller', :india => 'ruppee'}
# currencies[:italy] = 'euro'
# p currencies

# シンボル値:値でハッシュを作成することができる
# currencies = {japan: 'yen', us: 'doller', india: 'rupee'}
# p currencies[:us]
# ハッシュの値もシンボルの場合
# currencies = {japan: :yen, us: :doller, india: :rupee}
# p currencies

# ハッシュのキーに異なるデータ型を混在させる
# 文字列のキーとシンボルのキーを混在させる（できるだけデータ型は揃えたほうがいい）
# hash = {'abc' => 123, def: 456}
# p hash['abc']
# p hash[:def]
# ハッシュのキーのデータ型が異なるとnilになってしまう
# p hash[:abc] # nil
# p hash['def'] # nil

# ハッシュの値に異なるデータ型を混在させる（よくある）
# person = {
#   name: "Alice", # 文字列
#   age: 20, # 数値
#   friends: ['Bob', 'Carol'], # 配列
#   phones: {home: '1234-0000', mobile: '5678-0000'} # ハッシュ
# }

# p person[:age]
# p person[:friends] 
# p person[:phones][:mobile]

# キーワード引数
def buy_burger(menu, drink: true, potato: true)
  order = []
  order.push(menu)
  if drink
    order.push("drink")
  end
  if potato
    order.push("potato")
  end
  
  message = ""
  order.each do |item|
    message += "#{item} "
  end
  puts message + "を購入しました。"
end

# buy_burger("cheese", drink: true, potato: true)
# buy_burger("fish", drink: true, potato: false)
# キーワード引数にはデフォルト値が設定されているので、省略可能
# buy_burger("fish", potato: false)
# buy_burger("cheese")
# 順番の入れ替えも可能
# buy_burger('fish', potato: false, drink: true)

# デフォルト値なしのキーワード引数を使ってメソッドを定義する
def buy_burger2(menu, drink:, potato:)
  order = []
  order.push(menu)
  if drink
    order.push("drink")
  end
  if potato
    order.push("potato")
  end
  
  message = ""
  order.each do |item|
    message += "#{item} "
  end
  puts message + "を購入しました。"
end

buy_burger2("potato", drink: true, potato: true)
# キーワード引数を省略するとエラーになる
# buy_burger2("fish", potato: false) # missing keyword: :drink (ArgumentError)
# ハッシュをキーワード引数として渡すことも可能
params = {drink: true, potato: true}
buy_burger2("potato", **params)
