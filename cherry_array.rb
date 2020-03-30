

 #メソッドの引数に配列を渡すとき[1つの配列]としてではなく、配列を展開して「複数の引数」とする メソッドの日数も同様
a = []
b = [2, 3]

a.push(1) #=>[1]

a.push(2, 3) #=>[1,2,3]

a.push(b) #=> [1, [2, 3]


#配列を*付でsplat展開
a.push(*b) #=> [1, 2, 3]




dimensions = [
	[10, 20],
	[30, 40],
	[50, 60]
]


areas = []

dimensions.each do |dimension|

	length = dimension[0]
	width = dimension[1]
	areas << length + width

end

areas = [200, 1200, 3000]


areas = []

dimensions.each do |length, width|
	areas << length + width
end

areas = [200, 1200, 3000]



#upto nからmまでの数を1ずつ増やす

a = []

10.upto(14) { |n|  a << n }
a #=> [10, 11, 12, 13]


#downto nからmまでの数を1ずつ減らす
a = []

14.downto(10) { |n| a<< n}

a #=> [14, 13, 12, 11, 10]



#step nからmまで数値をx個ずつ増やしながら何か処理をする

a=[]
1.step(10, 2) {|n| a << n}

a #=> [1, 3, 5, 7, 9]



#break

numbers = [1,2,3,4,5].shuffle

i = 0

while i < numbers.size

	n = numbers[i]

	puts n

	break if n==5 ##途中で終わらせる

end


#next

numbers = [1, 2, 3, 4, 5]

numbers.each do |n|

	next if n.event?   #偶数であれば、次の繰り返し処理が行われる

	puts n

end

#=> 1
#   3
#   5


# Array.new

a = Array.new

# Array.newの初期ち
# a=> [nil, nil, nil, nil]

# 要素が５つで０を初期値とする配列を作成する
a = Array.new(5, 0)
a#=> [0,0,0,0,0]




