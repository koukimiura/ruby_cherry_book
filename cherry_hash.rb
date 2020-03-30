currencies = {'japan' => 'yen', 'us' =>'dollar', 'india' => 'rupee'}

currencies.each do |key, value|

	puts "#{key}:#{value}"

end


#ブロック引数を1つにするとキーと値が配列に格納される

currencies = {'japan' => 'yen', 'us' =>'dollar', 'india' => 'rupee'}

currencies.each do |key_alue|

	key = key_value[0]
	value = key_value[1]
	puts "#{key}:#{value}"

end


#キーワード引数


def bu_burger(menu, drink: true, potato: true) #defalut


	if drink
		# 処理
	end

	if potato
		# deal
	end
end



#call

buy_burger('cheese', drink: true, potato: true)
buy_burger('cheese', drink: true, potato: false)
buy_burger('taco') #defalutがあるのでメニューだいれるs


params = {drink: true, potato: false}
buy_burger('cheese', params)




#**をつけてハッシュれてらるないでhashを展開　（mergeメソッドを使っても
h = {us: 'dollar', india: 'rupee'}


{japan: 'yen', **h} #=> {:japan => 'yen', :us => 'dollar', :india => 'rupee'}


# つけないとエラーになる可)


#想定外のキーワードはothers引数で受け取る

def buy_burger(menu, drink: true, potato: true, **others)

	#othersはhashとして渡される
	puts others

	# 省略
end




bu_burger('fish', drink: true, potato: false, salad: true, chicken: false)

#=> {:salad => true, :chichen => false}




# ハッシュから配列へm配列からハッシュへ

currencies = {japan: 'yen', us:'dollar', india: 'rupee'}


 currencies.to_a #=> [[:japan, "yen"], [:us, "dollar"], [:india, "rupee"]]

 #配列からハッシュ

 currencies = [[:japan, "yen"], [:us, "dollar"], [:india, "rupee"]]
 currencies.to_h #=> {japan: 'yen', us:'dollar', india: 'rupee'}



 array = [1, 2, 3, 4]

 array.to_h #=> #TypeError




 # %記法でシンボルやシンボルの配列を作成する

 %s!ruby is fun! #=> :"ruby is fun"

 %s(ruby is fun) #=> "ruby is fun"


 #配列を作る

 %i(apple orange melon) #=> [:apple, :orange, :melon]


