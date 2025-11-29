######################
# モジュール
# 実行方法: ruby sample/module.rb 
######################
# module Greetable
#   def hello
#     'hello'
#   end
# end

# モジュールからインスタンスを作成することはできない
# greetable = Greetable.new # undefined method `new' for Greetable:Module (NoMethodError)
# 他のモジュールを継承して新しいモジュールを作ることはできない
# module Awesome < Greetable # syntax error, unexpected '<'
# end

######################
# モジュールを利用したメソッド定義
######################
# ログ出力用のメソッドを提供するモジュール
module Loggable
  # クラス外から使用しないので、privateにする
  # private

  def log(text)
    puts "[LOG] #{text}"
  end
end

# include先のメソッドを使うモジュール
module Taggable
  def price_tag
    # include先でpriceメソッドが定義されている前提
    "#{price}円"
    # NOTE: selfはinclude先のクラスのインスタンスとなる
    # "#{self.price}円"
  end
end

class Product
  # include Loggable
  # include Taggable
  
  # Loggableを特異メソッド（クラスメソッド）として定義する
  extend Loggable

  # extendを使うとクラス直下で呼び出すことも可能
  log 'Defined Product class.'

  def self.create_products(names)
    log 'create_product is called.'
  end

  def title
    log 'title is called.'
    'A great movie'    
  end

  def price
    1000
  end
end

class User
  include Loggable

  def name
    log 'name is called.'
    'Alice'
  end
end

# product = Product.new
# p product.title

# user = User.new
# p user.name

# 外部からは呼び出せなくなる
# product.log "public?" # private method `log' called for #<Product:0x000000010b5c9e80> (NoMethodError)

# p product.price_tag

# クラスメソッド経由でlogメソッドが呼び出される
Product.create_products([])
# Productクラスのクラスメソッドとして直接呼び出すことも可能(publicであれば)
Product.log('Hello.')

# TODO: ここからやる
# Product.include.Loggable.log('include')
# Product.extend.Loggable.log('extend')
