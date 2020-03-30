

def user_exists?

	#データベースなどからuserを探す
	user = find_user

	if user
		true

	else
		false

	end

end

#p175  同じこと

def user_exists?

	!!find_user

end




