require './PasswordChecker'

RSpec.describe "Password Checker" do 

	let(:p_checker) do
		mailer = double("Mailer")
		expect(mailer).to receive(:send_mail)
		PasswordChecker.new(PassStrengthChecker.new, mailer)
	end

	context "Sends mail" do 
		it "should send an eMail cause its password is empty" do
			p_checker.check_password("dummy@test.com", "")
		end

		it "should receive an eMail cause its password is too short" do
			p_checker.check_password("dummy@test.com", "a")
		end

		it "should receive an eMail cause its password has no upcase and downcase mixed" do
			p_checker.check_password("dummy@test.com", "asdfjksdf")
		end

		it "should receive an eMail cause its password does not have any number" do
			p_checker.check_password("dummy@test.com", "adfasdffFASD")
		end

		it "should receive an eMail cause its password does not have any letter" do
			p_checker.check_password("dummy@test.com", "213423434543&&&")
		end

		it "should receive an eMail cause its password does not have any symbol" do
			p_checker.check_password("dummy@test.com", "SdfffJDFD56")
		end

		it "should receive an eMail cause its password includes weak words contained in eMail address" do
			p_checker.check_password("dummy@test.com", "Sdffrrdummy43%")
		end

		it "should receive an eMail cause its password includes weak words contained in eMail address" do
			p_checker.check_password("dummy@test.com", "Sdgtest23%%")
		end
	end

	context "Correct `passwords" do 
		it "should NOT receive an email cause it is strong" do
			mailer = double("Mailer")
			expect(mailer).not_to receive(:send_mail)
			PasswordChecker.new(PassStrengthChecker.new, mailer).check_password("dummy@test.com,", "aBz@ll45Pd")
		end
	end

end