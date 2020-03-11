require "io/console"

# 手札を入力する
def input_hand(name)
  print "プレイヤー#{name}さん あなたの手札を好きな数字3桁で入力してください。\n入力受付中 => "
  hand = STDIN.noecho(&:gets).chop
  puts "\n\n"
  hand.match(/\A\d{3}\z/)
end

# 1.プレイヤーAが0〜9の10枚のカードの中から手札を決める
a_hand = input_hand("A")
puts a_hand

# 2.プレイヤーBが0〜9の10枚のカードの中から手札を決める
b_hand = input_hand("B")
puts b_hand

# 3.プレイヤーAが過去にコールしたことがあれば履歴を表示する

# 4.プレイヤーAが数字をコールする

# 5.プログラムで[EAT-BITE]を発表する

# 6.プレイヤーBが過去にコールしたことがあれば履歴を表示する

# 7.プレイヤーBが数字をコールする

# 8.プログラムで[EAT-BITE]を発表する

# 9.以降3〜8を繰り返し3EATが出たら終了する
