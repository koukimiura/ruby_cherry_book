#Procオブジェクトについて

#Procはブロックをインスタンス化したもの


hello_proc = Proc.new do 
	'Hello'
end

#do... endの代わりに{}を使っておも良い

hello_proc = Proc.new{ 'Hello!'}

#実行する際はcallを使う

hello_proc.call #=> "Hello"


#引数を利用するProcオブジェクト
add_proc = Proc.new{ |a, b| a+b}
add_proc.call(10, 20) #=> 30


#引数のblockはProcオブジェクトであるということができる。

def greeting(&block)

	puts 'おはよう'
	text = block.call('こんにちは') #callはProcオブジェクト（ブロック)を呼ぶ（実行）する魔法の言葉
	puts text
	puts 'こんばんは'
end

#ブロックの代わりにProcオブジェクトをメソッドの引数として渡す

repeat_proc = Proc.new( {|text| text*2}) #Procオブジェクトを作成し、それをブロックの代わりとしてgreetingメソッドに渡す

#実行
greeting(&repeat_proc)


# => おはよう
# => こんにちはこんにちはs
# => こんばんは



#greetingメソッドでブロックを受け取るのではなく、Procオブジェクトを普通のオブジェクトとして渡す。

def greeting(arrange_proc)

	puts 'おはよう'
	text = arrange_proc.call('こんにちは')
	puts text
	puts 'こんばんは'

	#Procオブジェクトを普通の引数としてgreetingメソッドに渡す(&をつけない)

	repeat_proc = Proc.new( {|text| text * 2}) #Procオブジェクトを作成し、それをブロックの代わりとしてgreetingメソッドに渡す
	#実行
	greeting(repeat_proc)
end





#メモ
# メソッドの受け取れるブロックの数は最大1つ。しかし、Procオブジェクトはただのオブジェクトなので普通の引数として渡す分には複数行ける
# .ex)

# greeting(proc_1, proc_2, proc_3)

# shuffle_proc = Proc.new( {|text| text.chars.shuffle.join})
# repeat_proc = Proc.new( {|text| text * 2})
# question_proc = Proc.new( {|text| text "#{text?}")

# greeting(shuffle_proc, repeat_proc, question_proc)





#Proc.newとラムダの違い

#Proc.newの実行
add _proc = Proc.new { |a, b| a + b}
add_proc.call(10, 20) #=> 30


#ラダムの作成と実行
add_lamda = ->(a, b) {a + b}
add_lamda.call(10, 20) #=> 30






















#10.5.2 &とto_procメソッド

reserse_proc = Proc.new { |s| s.reverse }

['Ruby', 'Java', 'Pler'].map(&reserse_proc) #=> ['ybuR', 'avaJ', 'lreP']

# &の役割はProcオブジェクトをブロックと認識させるだけではなく、右辺のオブジェクトに対してto_procを呼び出し, 戻り値として得られたProcオブジェクト(今回で言うProc.new { |s| s.reverse })をメソッドに与える。


['Ruby', 'Java', 'Pler'].map(&reserse_proc) #=> ['ybuR', 'avaJ', 'lreP']


# &は引数(Procオブジェクト)をブロックとして認識させる。さらに右辺のreserse_procオブジェクトに対してto_procを呼び出す。

# 元々Procオブジェクトだったもの
reverse_proc = Proc.new { |s| s.reverse } 

other_proc = reverse_proc.to_proc #reverse_procはすでにProcオブジェクトである。reserse_procはProcクラスのインスタンスなのでProcクラスのto_procメソッドを呼び出せる。

#Procオブジェクトに対して.to_procメソッドを呼び出しても戻り値はtrue

reverse_proc.equal?(other_proc) #=> true



#Procオブジェクト以外でto_procメソッドを持つものがある。それがシンボル

split_proc = :split.to_proc #Procオブジェクト化（インスタンス化） シンボルはProcオブジェクト以外でto_procメソッドを呼び出せる。
spllit #=> <Proc: 0x00000000312f9a0(&:split)


シンボル使用のProcオブジェクトは引数によって実行される内容が異なる

#引数が１つの時はれしバーに対して、元のシンボルと同じメソッド名を呼び出す。
split_proc.call('a-b-c-d e') #=> ['a-b-c-d', 'e']
"a-b-c-d e".splitと同じになる。 (ホワイトスペースで分割)


#引数が2つ、１つ目はレシーバのまま、２つ目はシンボルで指定したメソッドの第一引数（split)となる。

"a-b-c-d e".split("-")と同じになる。 (-で分割)
split_proc.call('a-b-c-d e', '-') #=> ["a", "b", "c", "d e"]







