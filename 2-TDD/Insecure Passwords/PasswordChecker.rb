
require './PassStrengthChecker'

class PasswordChecker

	def initialize pass_strength_checker, mailer_agent
		@pass_strength_checker = pass_strength_checker
		@mailer = mailer_agent
	end

	def check_password email, password 
		if is_password_weak? email, password 
			@mailer.send_mail()
		end
	end

	def is_password_weak? email, password 
		@pass_strength_checker.check_pass_strength password, email
	end
		
end