######################
# クラス
######################
# 実行方法
# ruby lib/class.rb

######################
# クラスを使わない場合
######################
# ユーザーのデータを作成する
users = []
users << {first_name: 'Alice', last_name: 'Ruby', age: 20}
users << {first_name: 'Bob', last_name: 'Python', age: 30}

# ユーザーの氏名を作成するメソッド
def full_name(user)
  "#{user[:first_name]} #{user[:last_name]}"
end

# ユーザーのデータを表示する
users.each do |user|
  puts "氏名:#{full_name(user)}、年齢 #{user[:age]}"
end

p users[0][:first_name] # "Alice"
p users[0][:first_mame] # nil

# 勝手に新しいキーを追加
users[0][:country] = 'japan'
# 勝手に値を変更
users[0][:first_name] = 'Carol'
# ハッシュの中身の値が変更される
p users[0] # {:first_name=>"Carol", :last_name=>"Ruby", :age=>20, :country=>"japan"}

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
