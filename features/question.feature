Feature: Add question
    In order to create a question, the user must fill in the form

    Scenario: Creates a valid question
        Given I am on the Add Question page
        And I "Create" question with text "Sample Question?"
        And I see message "Question was successfully created."
		And an answer is created with the text "Random answer"
		Then the message received is "Answer was successfully created."
		
		Given I click on the Question page
		And "Answers" is clicked
		And "Add an answer" is clicked
		And an answer is created with the text "Random thing"
		Then the message received is "Answer was successfully created."

		And "All Questions" is clicked
		And "Edit Question" is clicked
		And I "Update" question with text "BLAH GAHH" 
		Then the message received is "Question was successfully updated."