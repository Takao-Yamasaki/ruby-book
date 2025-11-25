######################
# クラスの継承
# 実行方法: ruby sample/class2.rb
######################
######################
# デフォルトで継承されるObjectクラス
######################
# class User
# end

# user = User.new
# p user.to_s
# p user.nil?
# Userクラスにメソッドを定義していないが、メソッドを使えるのはObjectクラスを継承しているため
# p User.superclass # Object
# メソッドの一覧を確認することができる
# p user.methods.sort
######################
# オブジェクトのクラスを確認する
######################
# user = User.new
# p user.class # User
# # instance_ofメソッドで確認することもできる
# p user.instance_of?(User) # true
# p user.instance_of?(String) # false
# # is_a?で継承関係にあるか確認することができる
# p user.is_a?(User) # true
# p user.is_a?(Object) # true
# p user.is_a?(BasicObject) # true
# p user.is_a?(String) # false

######################
# 他のクラスを継承したクラスを作る
######################
class Product
  attr_reader :name, :price

  # キーワード付き引数にする
  def initialize(name, price: 0)
    # @name = name
    # @price = price
    puts "name: #{name}, price: #{price}"
  end

  # to_sをオーバーライドしたメソッド
  def to_s
    "name: #{name}, price: #{price}"
  end
end

class DVD < Product
  # nameとpriceは、スーパークラスでattr_readerが設定されているので不要
  attr_reader :running_time

  # def initialize(name, price, running_time)
  #   # スーパークラスのinitializeメソッドを呼び出す
  #   super(name, price)
  #   @running_time = running_time
  # end

  # NOTE:スーパークラスとサブクラスで引数が同じだった場合、可変長引数*でsuperメソッドにそのまま渡す
  # NOTE:キーワード引数がある場合は、*, **と明示的に指定する
  def initialize(*, **)
    super
  end

  # to_sをオーバーライドしたメソッド
  # def to_s
  #   "super: #{super}, running_time: #{running_time}"
  #   # "name: #{name}, price: #{price}, running_time: #{running_time}"
  # end
end

# product = Product.new('A great movie', 1000)
# p product.name
# p product.price 

dvd = DVD.new('A great movie', price: 1000)
p dvd.name
p dvd.price
# p dvd.running_time

# dvd = DVD.new('A great movie', 1000)
# p dvd.name
# p dvd.price

######################
# メソッドのオーバーライド
######################
# product = Product.new('A great movie', 1000)
# p product.to_s # "#<Product:0x000000010cca14f0>"
# dvd = DVD.new('An awesome film', 3000, 120)
# p dvd.to_s # "#<DVD:0x000000010a8dcc40>"

######################
# クラスメソッドの継承
######################
class Foo
  def self.hello
    'hello'
  end
end

class Bar < Foo
end

# Fooを継承したBarでもクラスメソッドを呼び出せる
p Foo.hello
p Bar.hello

######################
# * **
######################
# 余分に渡された引数を無視する
# 最初の2つの引数のみ使い、あとじゃ無視する
def add(a,b,*)
  a + b
end
p add(1,2,3,4,5) # 3

# name以外のキーワードは無視する
def greet(name:,**)
  "Hello, #{name}!"
end
p greet(name: 'Alice', friend: 'Bob')

