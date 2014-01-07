require  "spec_helper"

describe Answer do
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
