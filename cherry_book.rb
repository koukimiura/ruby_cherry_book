


#divmodメソッド

quo_rem = 14.divmod(3)

puts "商#{quo_rem[0]}、余り=#{quo_rem[1]}"



# 偶数チェック

numbers = [1, 2, 3, 4]

sum = 0

numbers.each do |n|
 
 #三項演算子(条件演算子）if文と同じ
 #参照
 #https://qiita.com/lasershow/items/160c854e4256ba596ec5
 sum_value = n.even? ? n * 10 : n

 sum += sum_value

end

puts sum

end

#1~10までの範囲オブジェクトをarray化する
nums =[]
numbers = (1...11).to_a

numbers.step(2) { |n| nums << n }

 puts nums




#nu以上以下、n以上m未満の判定をする


#範囲オブジェクト
def liquid?(temperature)
	(0...100).include?(temperature)
end

liquid?(-1) #=>false
liquid?(0) #=>true
liquid?(99) #=>true
liquid?(100) #=>false


#多重代入(切り捨て数を配列化できるs)

e, f = 100, 200, 300

# e =>100
# f => 200

e, *f = 100, 200, 300

# e =>100
# f => [200, 300]


