######################
# 実行方法
# ruby sample/rainbowable.rb 
######################
require_relative '../lib/rainbowable'

# includeする
String.include Rainbowable
Array.include Rainbowable

puts 'Hello, world!'.rainbow
puts [1, 2, 3].rainbow
