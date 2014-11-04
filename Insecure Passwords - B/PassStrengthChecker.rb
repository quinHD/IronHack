class PassStrengthChecker

	def check_pass_strength pass
		flag = false
		pass_test_list=[
			Short_Pass_Checker.new,
			Upper_Lower_Case_Checker.new,
			Letter_Number_Symbol_Checker.new,
			Name_Domain_In_Email_Checker.new
		]

		i=0
		while flag==false && i<pass_test_list.length
			flag = pass_test_list[i].check_pass pass.to_s
			i+=1
		end

		return flag
	end
end

class Upper_Lower_Case_Checker
	def check_pass pass
		pass == pass.upcase || pass == pass.downcase
	end
end


class Short_Pass_Checker
	def check_pass pass
		pass.length < 7
	end
end

class Letter_Number_Symbol_Checker
	def check_pass pass
		
	end
end

class Name_Domain_In_Email_Checker
	def check_pass pass
		
	end
end