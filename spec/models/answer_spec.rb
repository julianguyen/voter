require  "spec_helper"

describe Answer do
	describe "Length" do
		it "have character count between 1 and 250" do
			Answer.create(answer: "a")
			expect(Answer.where(:answer => "a").exists?).to eq(true)
		end
		it "should fail character count less than 1" do
			Answer.create(answer: "")
			expect(Answer.where(:answer => "").exists?).to eq(false)
		end
	 	it "should fail character count greater than 250" do
			Answer.create(answer: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
			expect(Answer.where(:answer => "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").exists?).to eq(false)
		end
	end

	describe "Duplicate" do
		it "makes a new answer" do
			expect(Answer.where(:answer => "a").exists?).to eq(false)
			Answer.create(answer: "a")
			expect(Answer.where(:answer => "a").exists?).to eq(true)
		end
		it "should fail duplicate Answer creation" do
			Answer.create(answer: "a")
			Answer.create(answer: "a")
			expect(Answer.where(answer: "a").count).to eq(1)
		end
	end
end

