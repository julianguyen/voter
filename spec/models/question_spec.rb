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
    end
end
