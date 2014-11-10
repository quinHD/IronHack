require './Anagrams'

RSpec.describe "Anagrams" do

	class FileReaderStub 
		def initialize dictionary
			@dictionary = dictionary
		end
		def get_dictionary
			@dictionary
		end
	end

	let (:anagrams){Anagrams.new(FileReaderStub.new(["acb"]))}
	let (:serious_anagrams){Anagrams.new(FileReaderStub.new(["enlist", "inlets", "listen", "silent", "boaster", "boaters"]))}
	
	it "returns anagrams of one letter" do
		expect(anagrams.calculate_anagrams("a")).to eq(["a"])
	end

	it "returns anagrams of two letters" do
		expect(anagrams.calculate_anagrams("ab")).to eq(["ab","ba"])
	end

	it "returns anagrams of three letters" do
		expect(anagrams.calculate_anagrams("abc")).to eq(["abc", "acb", "bac", "bca", "cab", "cba"])

	end

	it "validates if an anagrams existe in serious dictionary" do
		expect(serious_anagrams.validate_anagrams()).to eq(["enlist", "inlets", "listen", "silent"].sort)
	end
end