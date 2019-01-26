# データを受け取り、返却するCGIプログラムの起動
require 'rubygems'
require 'cgi'
cgi = CGI.new

# データを受け取った後、HTMLの形式でレスポンス（反応）を返す
cgi.out("type" => "text/html", "charset" => "UTF-8") {
  # 受け取ったデータcgi['input']で取り出し、ローカル変数に代入する
  # 目印の'input'から情報を取り出す
  get = cgi['goya']

  # HTMLでレスポンスを返却する
  "<html>
    <body>
      <p>ゴーヤを売った相手とゴーヤの品質が悪いもの(false)の件数は以下の通りです。</p>
      <p>#{get}</p>
    </body>
  </html>"
}