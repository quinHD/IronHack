require './PassStrengthChecker'

class PasswordChecker

	def initialize pass_strength_checker, mailer_agent
		@pass_strength_checker = pass_strength_checker
		@mailer = mailer_agent
		@flag = false
	end

	def check_password email, password 
		if(email=="" || password=="")
			return "invalid parameters"		
		else

			flag = @pass_strength_checker.check_pass_strength password
			
			if flag==true

				@mailer.send_mail()
			end
		end

	end
end


RSpec.describe "Password Checker" do 

	it "should receive a password cause it is too short" do
		mailer = double("Mailer")
		expect(mailer).to receive(:send_mail)
		PasswordChecker.new(PassStrengthChecker.new, mailer).check_password("vavoom02@gmail.com,", "a")
	end

	it "should receive a password cause it has no upcase and downcase mixed" do
		mailer = double("Mailer")
		expect(mailer).to receive(:send_mail)
		PasswordChecker.new(PassStrengthChecker.new, mailer).check_password("vavoom02@gmail.com,", "")
	end

	it "should NOT receive an email cause it is strong" do
		mailer = double("Mailer")
		expect(mailer).not_to receive(:send_mail)
		PasswordChecker.new(PassStrengthChecker.new, mailer).check_password("vavoom02@gmail.com,", "aBz@ll45Pd")
	end
end