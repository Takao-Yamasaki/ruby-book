######################
# 例外処理
# 実行方法: ruby sample/exception.rb
######################
# puts 'Start.'
# begin
#   p 1 + '10'
# rescue
#   puts '例外が発生したが、このまま続行する'
# end
# # 上の行で例外が発生するので、ここから下は実行されない
# puts 'End.'

######################
# 例外処理の流れ
######################
# def method_1
#   puts 'method_1 start.'
#   # begin
#     method_2
#   # rescue
#     puts '例外が発生しました'
#   # end
#   puts 'method_1 end.'
# end

# def method_2
#   puts 'method_2 start.'
#   method_3
#   puts 'method_2 end.'
# end

# def method_3
#   puts 'method_3 start.'
#   # ZeroDivisionErrorを発生させる
#   p 1 / 0
#   puts 'method_3 end.'
# end

# method_1

######################
# 例外処理オブジェクトから情報を取得する
######################
# begin
#   # 例外が起きる処理
#   1 / 0
# rescue => e
#   # 例外が発生した場合の処理
#   puts "エラークラス: #{e.class}"
#   puts "エラーメッセージ: #{e.message}"
#   puts "バックトレース -----"
#   puts e.backtrace
#   puts "-----"
# end

# 出力結果
# エラークラス: ZeroDivisionError
# エラーメッセージ: divided by 0
# バックトレース -----
# sample/exception.rb:47:in `/'
# sample/exception.rb:47:in `<main>'
