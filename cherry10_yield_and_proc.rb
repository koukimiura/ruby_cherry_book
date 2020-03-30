

def greeting 
	puts 'おはよう'
	#ブロックに引数を渡し、戻り値を受け取る
	text = yield 'こんにちは'

	#ブロックの戻り値をコンソールに出力する
	puts text
	puts 'こんばんは'
end

greeting do |text|

	#yieldで呼び出された文字列('こんにちは')を2回繰り返す
	text * 2
end




def greeting(&block) #ブロック(do~endま)をメソッドの引数として受け取る
	puts 'おはよう'
	# callメソッドを使ってブロッックを実行
	text = block.call('こんにちは')
	puts text #出力
	puts 'こんばんは'
end

#実行
greeting do |text| #実行されたブロック
	text * 2
end

#=> おはよう
#   こんにちはこんにちは
#   こんばんは

