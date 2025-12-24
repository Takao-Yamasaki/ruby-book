######################
# メソッドの可視性
# 実行方法: ruby sample/method_visibility.rb
######################

######################
# publicメソッド
######################
# class User
#   def hello
#     'Hello!'
#   end
# end

# user = User.new
# publicメソッドなので、クラス外部から呼び出せる
# puts user.hello

######################
# privateメソッド
######################
# class User
#   private

#   def hello
#     'Hello!'
#   end 
# end

# user = User.new
# # privateメソッドなので、クラス外部から呼び出せない
# puts user.hello

######################
# selfを付けてprivateメソッドを呼び出す
######################
# class User
#   def hello
#     "Hello, I am #{self.name}."
#   end

#   private
  
#   def name
#     'Alice'
#   end
# end

# user = User.new
# puts user.hello

######################
# privateメソッドはサブクラスでも呼び出せる
######################
# class Product
#   def to_s
#     # nameは常に"A great movie"になるとは限らない
#     "name: #{name}"
#   end
  
#   private
#   # これはprivateメソッド
#   def name
#     'A great movie.'
#   end
# end

# class DVD < Product
#   def to_s
#     # nameはスーパークラスのprivateメソッド
#     "name: #{self.name}"
#   end

#   # スーパークラスのprivateメソッドをオーバーライドする
#   def name
#     'An awesome film'
#   end
# end

# dvd = DVD.new
# p dvd.to_s # "name: An awesome film"

######################
# サブクラスでメソッドをオーバーライドすると、可視性も同時に変更できる
######################
# class Product
#   private
  
#   def name
#     'A great movie'
#   end
# end

# class DVD < Product
#   public

#   def name
#     'An awesome file'
#   end
# end

# dvd = DVD.new
# p dvd.name # "An awesome file"

######################
# クラスメソッドはprivateキーワードの下に定義しても、privateにならない
######################
# class User
#   private

#   def self.hello
#     'Hello!'
#   end
# end

# p User.hello

######################
# クラスメソッドをprivateにしたい場合
######################
## 1.class << selfを使う
# class User
#   class << self
#     private
    
#     def hello
#       'Hello'
#     end
#   end
# end
# User.hello # private method `hello' called for class User (NoMethodError)

## 2.private_class_methodを使う
# class User
#   def self.hello
#     'Hello!'
#   end
  
#   private_class_method :hello
# end
# User.hello # private method `hello' called for class User (NoMethodError)
