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
class User
  def hello
    "Hello, I am #{self.name}."
  end

  private
  
  def name
    'Alice'
  end
end

user = User.new
puts user.hello
