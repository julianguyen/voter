require  "spec_helper"

describe VotesController do
	describe "Vote message" do
		it "Should acknowledge vote submission" do 
			theid = Question.create(question: "What time is it?")
			ans1 = Answer.create(questionid: theid, answer: "5 pm")
			ans2 = Answer.create(questionid: theid, answer: "6 pm")
			post :voting, {:ans => ans1}
		end
		 it "Should not acknowledge vote submission" do
		 	theid = Question.create(question: "What time is it?")
		 	ans1 = Answer.create(questionid: theid, answer: "5 pm")
		 	ans2 = Answer.create(questionid: theid, answer: "6 pm")
		 	post :voting, {:ans => 94983}
		 end
	end
end
