require "io/console"

# 重複なしの数字3桁か判定する
def unique_three_digits?(hand)
  hand.match(/\A\d{3}\z/) && hand.split("").uniq.length == 3
end

# 手札を入力する
def input_hand(name)
  print "プレイヤー#{name}さん あなたの手札を好きな数字3桁で入力してください。\n入力受付中 => "
  hand = STDIN.noecho(&:gets).chop
  puts "\n\n"

  until unique_three_digits?(hand)
    print "無効な入力です。もう一度入力してください。\n入力受付中 => "
    hand = STDIN.noecho(&:gets).chop
    puts "\n\n"
  end

  puts "------------- 入力完了 -------------\n\n\n\n"
  sleep(0.5)

  hand
end

# コールターン
def call_turn(name, turn, hand_array)
  puts "プレイヤー#{name}さんの第#{turn}ターンです。\n\n"

  print "コールする数字を入力してください。\n入力受付中 => "
  call = gets.chomp
  puts "\n"
  
  until unique_three_digits?(call)
    print "無効な入力です。もう一度入力してください。\n入力受付中 => "
    call = gets.chomp
    puts "\n"
  end

  print "『#{call}』ですね。 結果は"
  5.times do
    sleep(0.3)
    print "."
  end
  puts "\n\n"

  call_array = call.split("")
  eat = bite = 0

  3.times do |i|
    3.times do |j|
      if call_array[i] == hand_array[j] && i == j
        eat = eat + 1
      elsif call_array[i] == hand_array[j]
        bite = bite + 1
      end
    end
  end

  if eat == 3
    judgement = "[3]EAT！ 見事相手の手札を見破りました！"
  else
    judgement = "[#{eat}]EAT-[#{bite}]BITE"
  end

  puts "#{judgement}\n\n"
  sleep(0.5)
  puts "------------ ターン終了 ------------\n\n\n\n"
  sleep(0.5)

  { turn: turn, call: call, judgement: judgement }
end

# 1.プレイヤーAが0〜9の10枚のカードの中から手札を決める
a_hand = input_hand("A")
a_hand_array = a_hand.split("")

# 2.プレイヤーBが0〜9の10枚のカードの中から手札を決める
b_hand = input_hand("B")
b_hand_array = b_hand.split("")

# 3.プレイヤーAが過去にコールしたことがあれば履歴を表示する
# 4.プレイヤーAが数字をコールする
# 5.プログラムで[EAT-BITE]を発表する
turn = 1
a_called_list = []
a_call = call_turn("A", turn, b_hand_array)
a_called_list.push(a_call)
p a_called_list

# 6.プレイヤーBが過去にコールしたことがあれば履歴を表示する
# 7.プレイヤーBが数字をコールする
# 8.プログラムで[EAT-BITE]を発表する
b_called_list = []
b_call = call_turn("B", turn, a_hand_array)
b_called_list.push(b_call)
p b_called_list

# 9.以降3〜8を繰り返し3EATが出たら終了する
turn = turn + 1
