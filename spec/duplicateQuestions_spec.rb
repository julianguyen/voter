require  "spec_helper"

describe Question do
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
