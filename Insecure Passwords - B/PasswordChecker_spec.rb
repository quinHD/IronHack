require './PasswordChecker'

RSpec.describe "Password Checker" do 

	it "should receive an eMail cause its password is too short" do
		mailer = double("Mailer")
		expect(mailer).to receive(:send_mail)
		PasswordChecker.new(PassStrengthChecker.new, mailer).check_password("vavoom02@gmail.com,", "a")
	end

	it "should receive an eMail cause its password has no upcase and downcase mixed" do
		mailer = double("Mailer")
		expect(mailer).to receive(:send_mail)
		PasswordChecker.new(PassStrengthChecker.new, mailer).check_password("vavoom02@gmail.com,", "asdfjksdf")
	end

	it "should receive an eMail cause its password does not have any number" do
		mailer = double("Mailer")
		expect(mailer).to receive(:send_mail)
		PasswordChecker.new(PassStrengthChecker.new, mailer).check_password("vavoom02@gmail.com,", "adfasdffFASD")
	end

	it "should receive an eMail cause its password does not have any letter" do
		mailer = double("Mailer")
		expect(mailer).to receive(:send_mail)
		PasswordChecker.new(PassStrengthChecker.new, mailer).check_password("vavoom02@gmail.com,", "213423434543&&&")
	end

	it "should receive an eMail cause its password does not have any symbol" do
		mailer = double("Mailer")
		expect(mailer).to receive(:send_mail)
		PasswordChecker.new(PassStrengthChecker.new, mailer).check_password("vavoom02@gmail.com,", "SdfffJDFD56")
	end

	it "should receive an eMail cause its password includes weak words contained in eMail address" do
		mailer = double("Mailer")
		expect(mailer).to receive(:send_mail)
		PasswordChecker.new(PassStrengthChecker.new, mailer).check_password("vavoom02@gmail.com,", "Sdffrrvavoom0243%")
	end

	it "should receive an eMail cause its password includes weak words contained in eMail address" do
		mailer = double("Mailer")
		expect(mailer).to receive(:send_mail)
		PasswordChecker.new(PassStrengthChecker.new, mailer).check_password("vavoom02@gmail.com,", "Sdgmail23%%")
	end

	it "should NOT receive an email cause it is strong" do
		mailer = double("Mailer")
		expect(mailer).not_to receive(:send_mail)
		PasswordChecker.new(PassStrengthChecker.new, mailer).check_password("vavoom02@gmail.com,", "aBz@ll45Pd")
	end
end