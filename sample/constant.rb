######################
# 定数についてもっと詳しく
# 実行方法: ruby sample/constant.rb
######################
# class Product
#   DEFAULT_PRICE = 0

#   private_constant :DEFAULT_PRICE
# end
# p Product::DEFAULT_PRICE # private constant Product::DEFAULT_PRICE referenced (NameError)

######################
# メソッド内にスコープを限定した定数は定義できない
######################
# dynamic constant assignment (SyntaxError)
# def foo
#   BAR = 123
#   BAR * 10
# end

######################
# 定数のクラス構文直下やトップレベルで定義する
######################
# SOME_VALUE = 123

# class Product
#   DEFAULT_PRICE = 0
# end

# p SOME_VALUE # 123
# p Product::DEFAULT_PRICE # 0

######################
# Rubyの定数定義はそれ自体が値を返す
######################
# class TrafficLight
#   COLORS = [
#     GREEN = 0,
#     YELLOW = 1,
#     RED = 2
#   ]
# end

# p TrafficLight::GREEN # 0
# p TrafficLight::YELLOW # 1
# p TrafficLight::RED # 2

######################
# メソッドや条件分岐を使った動的な値も代入可能
######################
# NUMBERS =[1, 2, 3].map{ |n| n * 10}
# p NUMBERS # [10, 20, 30]

######################
# 定数と再代入
######################
class Product
  DEFAULT_PRICE = 0
  DEFAULT_PRICE = 1000
end

p Product::DEFAULT_PRICE

# 警告は出るが再代入できてしまう
# sample/constant.rb:59: warning: already initialized constant Product::DEFAULT_PRICE
# sample/constant.rb:58: warning: previous definition of DEFAULT_PRICE was here
# 1000
