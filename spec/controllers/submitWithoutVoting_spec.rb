require  "spec_helper"


describe VotesController do
	describe "Vote message" do
		before(:each) do
			theid = Question.create(question: "What time is it?")
            @ans2 = Answer.create(questionid: theid, answer: "6 pm")
            @ans1 = Answer.create(questionid: theid, answer: "5 pm")
		end
		it "Should acknowledge vote submission" do 
			post :voting, {:ans => @ans1}
			response.should redirect_to('/votes/voted')
		end
		 it "Should indicate error when vote was not speicifed" do
		 	post :voting
		 	response.should redirect_to('/votes/vote')
		 end
	end
end
