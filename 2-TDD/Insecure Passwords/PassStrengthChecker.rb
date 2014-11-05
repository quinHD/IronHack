class PassStrengthChecker

	def check_pass_strength pass, email
		flag = false
		pass_test_list=[
			Short_Pass_Checker.new,
			Upper_Lower_Case_Checker.new,
			Letter_Number_Symbol_Checker.new,
			Name_Domain_In_Email_Checker.new
		]

		i=0
		while flag==false && i<pass_test_list.length
			flag = pass_test_list[i].check_pass pass.to_s, email.to_s
			i+=1
		end

		return flag
	end
end

class Upper_Lower_Case_Checker
	def check_pass pass, email=""
		pass == pass.upcase || pass == pass.downcase
	end
end


class Short_Pass_Checker
	def check_pass pass, email=""
		pass.length < 7
	end
end

class Letter_Number_Symbol_Checker
	def check_pass pass, email=""
		!pass.match(/[a-zA-Z]/) || !pass.match(/[@#$%&-]/) || !pass.match(/[\d]/)

	end
end

class Name_Domain_In_Email_Checker
	def check_pass pass, email
		email_tokens = email.split('@')
		name = email_tokens[0]
		email_tokens = email_tokens[1].split('.')
		domain = email_tokens[0]

		(pass.include? name) || (pass.include? domain)
	end
end