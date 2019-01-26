# pgライブラリを使用する
require 'pg'

# rubyのプログラムをgoyaDBにつなげた、
# という情報をconnectionという名前の変数に格納する
# PG::connect(dbname: "goya")で、にrubyからgoyaDBに接続している
connection = PG::connect(dbname: "goya")
connection.internal_encoding = "UTF-8"
begin
  # connection変数を使いPostgreSQLを操作する
  # .execで、goyaDBに"select date, weight, give_for from crops;"
  # のSQLの命令文を直接実行する
  result = connection.exec("select date, weight, give_for from crops;")

  # 取り出した各行を処理する
  result.each do |record|
      # putsで取り出した一行ずつをコンソール上に出力する
      puts "ゴーヤの大きさ：#{record["weight"]}　売った相手：#{record["give_for"]}"
  end
ensure
  # 何かしらのエラーが発生した場合、
  # .finishでデータベースへのコネクションを切断する
  connection.finish
end