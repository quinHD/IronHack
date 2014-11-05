require './PassStrengthChecker'

class PasswordChecker

	def initialize pass_strength_checker, mailer_agent
		@pass_strength_checker = pass_strength_checker
		@mailer = mailer_agent
	end

	def check_password email, password 

		flag = @pass_strength_checker.check_pass_strength password, email
		
		if flag
			@mailer.send_mail()
		end
		
	end
end

