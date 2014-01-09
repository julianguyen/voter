Feature: Voting
    In order to vote, the user must select one answer

    Scenario: Voting
    	Given I am on the Add Question page
        And I update "question_question" field with text "Sample Question?" and click the button "Create"
        And I see message "Question was successfully created."
		And an answer is created with the text "Random answer"
		Then the message received is "Answer was successfully created."

		And "Add an answer" is clicked
		And an answer is created with the text "Random thing 1"
		Then the message received is "Answer was successfully created."

		And "Add an answer" is clicked
		And an answer is created with the text "Random thing 2"
		Then the message received is "Answer was successfully created."

        Given I am on the Voting page
		And I modify the "Sample Question?" by clicking "Vote" in "Votes"
		And I choose the vote "Random thing 1"
		Then the message received is "You have voted."

		Given I am on the Voting page
		And I modify the "Sample Question?" by clicking "Vote" in "Votes"
		And "Submit" button is clicked
		Then the message received is "You have to vote for something..."