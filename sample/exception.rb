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

######################
# クラスを指定して捕捉する例外を限定する
######################
# begin
#   # 例外が起きうる処理
#   # 1 / 0
#   # ZeroDivisionError以外のエラー(NoMethodError)が発生した場合は、捕捉されず、異常終了する
#   'abc'.foo
# # rescue ZeroDivisionError
# #   # 例外が発生した場合の処理
# #   puts '0で除算しました' # 0で除算しました
# # rescue NoMethodError
# #   puts '存在しないメソッドが呼び出されました' # 存在しないメソッドが呼び出されました
# rescue ZeroDivisionError, NoMethodError => e
#   puts '0で除算したか、存在しないメソッドが呼び出されました'
#   puts "エラー: #{e.class} #{e.message}"
# end

######################
# 継承関係とrescueの順番に注意する
######################
######################
# 間違った例外処理の例
######################
# begin
#   # NoMethodErrorを発生させる
#   'abc'.foo
# rescue NameError
#   # NoMethodErrorはここで捕捉される
#   puts 'NameErrorです' # NameErrorです
# rescue NoMethodError
#   # 永遠に実行されない
#   puts 'NoMethodErrorです'
# end

######################
# 正しい例外処理の例
######################
# begin
#   # NoMethodErrorを発生させる
#   # 'abc'.foo
#   # NameErrorを発生させる
#   # Foo.new
#   # ZeroDivisionErrorを発生させる
#   1 / 0
# rescue NoMethodError
#   puts 'NoMethodErrorです'
# rescue NameError
#   puts 'NameErrorです'
# # rescue StandardError
# #   puts 'その他のエラーです'
# rescue # 例外クラスを指定しないのほうがシンプル
#   puts 'その他のエラーです'
# end

######################
# 例外発生時にもう一度やり直すretry
######################
# カウンタを初期化する
# retry_count = 0
# begin
#   puts '例外処理を開始します'
#   1 / 0
# rescue
#   retry_count += 1
#   if retry_count <= 3
#     puts "retryします。(#{retry_count}回目)"
#     retry
#   else
#     puts 'retryに失敗しました。'
#   end
# end

######################
# 意図的に例外を発生させる
######################
# def currency_of(country)
#   case country
#   when :japan
#     'yen'
#   when :us
#     'doller'
#   when :india
#     'rupee'
#   else
#     # RuntimeError
#     # raise "無効な国名です。#{country}"

#     # ArgumentErrorにすることもできる
#     # raise ArgumentError, "無効な国名です。#{country}"
  
#     # 例外クラスのインスタンスを渡す方法もある
#     raise ArgumentError.new("無効な国名です。#{country}")
#   end
# end

# p currency_of(:japan)
# p currency_of(:italy) # 無効な国名です。italy (RuntimeError)
