######################
# クラス
# 実行方法: ruby sample/class.rb
######################
######################
# クラスを使わない場合
######################
# # ユーザーのデータを作成する
# users = []
# users << {first_name: 'Alice', last_name: 'Ruby', age: 20}
# users << {first_name: 'Bob', last_name: 'Python', age: 30}

# # ユーザーの氏名を作成するメソッド
# def full_name(user)
#   "#{user[:first_name]} #{user[:last_name]}"
# end

# # ユーザーのデータを表示する
# users.each do |user|
#   puts "氏名:#{full_name(user)}、年齢 #{user[:age]}"
# end

# p users[0][:first_name] # "Alice"
# p users[0][:first_mame] # nil

# # 勝手に新しいキーを追加
# users[0][:country] = 'japan'
# # 勝手に値を変更
# users[0][:first_name] = 'Carol'
# # ハッシュの中身の値が変更される
# p users[0] # {:first_name=>"Carol", :last_name=>"Ruby", :age=>20, :country=>"japan"}

######################
# クラスを使う場合
######################
# # Userクラスを定義する
# class User
#   attr_reader :first_name, :last_name, :age 
  
#   def initialize(first_name, last_name, age)
#     @first_name = first_name
#     @last_name = last_name
#     @age = age
#   end
  
#   # 氏名を作成するメソッド(引数で渡す必要がない)
#   def full_name
#     "#{first_name} #{last_name}"
#   end
# end

# # ユーザーのデータを作成する
# users = []
# users << User.new('Alice', 'Ruby', 20)
# users << User.new('Bob', 'Python', 30)


# users.each do |user|
#   puts "氏名:#{user.full_name}, 年齢: #{user.age}"
# end

# p users[0].first_name

# 存在しないメソッドを指定すると、エラーが出る
# p users[0].first_mame # undefined method `first_mame' for #<User:0x000000010cc2ee28 @first_name="Alice", @last_name="Ruby", @age=20> (NoMethodError)

# 勝手に変更できない
# users[0].country = 'japan' # undefined method `country=' for #<User:0x0000000108f1ec68 @first_name="Alice", @last_name="Ruby", @age=20> (NoMethodError)
# users[0].first_name = 'Carol' # undefined method `first_name=' for #<User:0x000000010a87ad88 @first_name="Alice", @last_name="Ruby", @age=20> (NoMethodError

######################
# クラスの定義
######################
# Userクラスの定義
# class User
#   # @nameを読み書きするメソッドを自動で定義する
#   # attr_accessor :name, :age
#   # @nameを読み取り専用にする
#   # attr_reader :name
#   # @nameを書き込み専用にする
#   # attr_writer :name
  

#   # インスタンスの初期化
#   def initialize(name)
#     # インスタンス変数: @で始まる変数で、同じインスタンス内部で共有される変数
#     @name = name
    
#     # 宣言していない場合はnilとなる
#     # puts "I am #{@name}."
    
#     # ローカル変数: 有効範囲は宣言されたメソッドやブロックの終わりまで
#     # shuffled_name = @name.chars.shuffle.join
    
#     # ローカル変数を宣言してないとエラーになる
#     # puts "I am #{shuffled_name}." # undefined local variable or method `shuffled_name' for #<User:0x0000000108b29298 @name="Alice"> (NameError)
#   end
#   # @nameを外部から参照するメソッド
#   # def name
#   #   @name
#   # end
#   # @nameを外部から変更するメソッド
#   # def name=(value)
#   #   @name = value
#   # end
#   # インスタンスメソッドの定義
#   def hello
#     puts "Hello!, I am #{@name}."
#   end

#   # Usersクラスのインスタンスを配列に入れて返すクラスメソッド
#   def self.create_users(names)
#     names.map do |name|
#       User.new(name)
#     end
#   end
# end

# オブジェクトの作成
# user = User.new('Alice', 20) # name: Alice age: 20
# インスタンスメソッドの呼び出し
# user.hello
# nameメソッドを経由して＠nameの内容を取得する
# p user.name
# name=メソッドを経由して＠nameの内容を変更する
# user.name = 'Bob'
# p user.name

# names = ['Alice', 'Bob', 'Carol']
# users = User.create_users(names)
# users.each do |user|
#   user.hello
# end

######################
# 定数
######################
# class Product
#   # デフォルトの価格を定数として定義する
#   DEFAULT_PRICE = 0
  
#   attr_reader :name, :price

#   def initialize(name, price = DEFAULT_PRICE)
#     @name = name
#     @price = price
#   end
# end

# product = Product.new('Alice')
# p product.price # 0が表示される

######################
# selfキーワード
######################
# class User
#   attr_accessor :name
  
#   def initialize(name)
#     @name = name
#   end

#   # selfなしでnameメソッドを呼び出す
#   def hello
#     "Hello, I am #{name}."
#   end

#   # selfありでnameメソッドを呼び出す
#   def hi
#     "Hi, I am #{self.name}."
#   end

#   # 直接インスタンス変数にアクセスする
#   def my_name
#     "My name is #{@name}"
#   end

#   # NOTE:セッターの場合はselfを明示的に付ける必要がある
#   # selfなしでnameメソッドを呼び出す。ローカル変数に代入されたものと見做される
#   def rename_to_bob
#     name = 'Bob' # "Bob"
#   end

#   # selfありでnameメソッドを呼び出す
#   def rename_to_carol
#     self.name = 'Carol'
#   end 

#   # 直接インスタンス変数にアクセスする
#   def rename_to_dave
#     @name = 'Dave'
#   end
# end

# user = User.new('Alice')
# p user.hello
# p user.hi
# p user.my_name

# user.rename_to_bob
# p user.name # "Alice"が出力されてしまう
# user.rename_to_carol
# p user.name
# user.rename_to_dave
# p user.name

######################
# クラスメソッド内部や構文直下のself
######################
# class Foo
#   # クラス定義の読み込み時に呼び出される
#   puts "クラス構文直下のself: #{self}"
  
#   # NOTE: ここでのselfはクラスメソッドを指す
#   def self.bar
#     # puts "クラスメソッド内のself: #{self}"
#     # クラスメソッドでインスタンスメソッドを呼び出す
#     # NOTE: ここでのselfはインスタンスメソッドを指すので、エラーとなる
#     # self.baz

#     puts "hello"
#   end

#   def baz
#     # puts "インスタンスメソッド内のself: #{self}"
#     # インスタンスメソッドからクラスメソッドを呼び出すので、エラーになる
#     # self.bar
#   end

#   # クラス構文直下でクラスメソッドを呼び出す
#   self.bar

#   # クラス定義自体も順次処理されるので、これでも実行できる
#   3.times do
#     puts "Hello!"
#   end
# end
# => クラス構文直下のself: Foo

# Foo.bar # クラスメソッド内のself: Foo

# foo = Foo.new 
# foo.baz # インスタンスメソッド内のself: #<Foo:0x00000001094c5dd8>
######################
# クラスメソッドをインスタンスメソッドから呼び出す
######################
class Product
  attr_accessor :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  # 金額を整形するクラスメソッド
  def self.format_price(price)
    "#{price}円"
  end

  def to_s
    # クラスメソッドをインスタンスメソッドから呼び出す
    formatted_price = Product.format_price(price)
    "name: #{name}, price: #{price}"
  end
end

product = Product.new('A great movie', 1000)
p product.to_s
