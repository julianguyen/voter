require  "spec_helper"

describe Question do
	describe "Length" do
		it "have character count between 1 and 250" do
			Question.create(question: "a")
			expect(Question.where(:question => "a").exists?).to eq(true)
		end
		it "should fail character count less than 1" do
			Question.create(question: "")
			expect(Question.where(:question => "").exists?).to eq(false)
		end
	 	it "should fail character count greater than 250" do
			Question.create(question: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
			expect(Question.where(:question => "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").exists?).to eq(false)
		end
    end

    describe "Duplicates" do
    	it "makes a new question" do
			expect(Question.where(:question => "a").exists?).to eq(false)
			Question.create(question: "a")
			expect(Question.where(:question => "a").exists?).to eq(true)
		end
		it "should fail duplicate Question creation" do
			Question.create(question: "a")
			Question.create(question: "a")
			expect(Question.where(question: "a").count).to eq(1)
		end
		it "should be case insensitive" do
			Question.create(question: "b")
			Question.create(question: "B")
			expect(Question.where(:question => "B").exists?).to eq(false)
		end
		it "should not have any leading whitespace" do
			Question.create(question: "canada is")
			Question.create(question: " canada is")
			expect(Question.where(:question => " canada is").exists?).to eq(false)			
		end
		it "should not have any trailing whitespace" do
			Question.create(question: "c")
			Question.create(question: "c ")
			expect(Question.where(:question => "c ").exists?).to eq(false)			
		end
    end
end
