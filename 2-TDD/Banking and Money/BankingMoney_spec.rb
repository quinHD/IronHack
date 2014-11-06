require './BankingMoney'

RSpec.describe "Banking and Money" do 

	it "should return 0 when amount is 0" do
		expect(BankingMoney.new.convert(0,:eur,:eur)).to eq(0)
	end


	it "should return the same amount with both currencies" do
		expect(BankingMoney.new.convert(2,:eur,:eur)).to eq(2)
	end

	it "should return an amount in euros converted to pounds" do
		expect(BankingMoney.new.convert(1,:eur,:gbp)).to eq(0.78478)
	end

	it "should return an amount in euros converted to dollars" do
		expect(BankingMoney.new.convert(1,:eur,:usd)).to eq(1.28356)
	end

	it "should return an amount in dollars converted to euros" do
		expect(BankingMoney.new.convert(1,:usd,:eur)).to eq(0.77818)
	end

	it "should return an amount in dollars converted to pounds" do
		expect(BankingMoney.new.convert(1,:usd,:gbp)).to eq(0.61070)
	end

	it "should return an amount in australian dollars converted to canadian dollars" do
		expect(BankingMoney.new.convert(1,:aud,:cad)).to eq(0.97786)
	end
end