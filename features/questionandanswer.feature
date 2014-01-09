Feature: Add/modify questions and answers
    In order to add/modify questions and answers, the user must fill in the form

    Scenario: Creates a valid question
        Given I am on the Add Question page
        And I update "question_question" field with text "Sample Question?" and click the button "Create"
        And I see message "Question was successfully created."
		And an answer is created with the text "Random answer"
		Then the message received is "Answer was successfully created."
		
	    Given I am on the Add Question page
        And I update "question_question" field with text "Sample Question2?" and click the button "Create"
        And I see message "Question was successfully created."
		And an answer is created with the text "Random answer2"
		Then the message received is "Answer was successfully created."

		Given I click on the Question page
		And I modify the "Sample Question?" by clicking "Answers" in "Questions"
		And I modify the "Random answer" by clicking "Edit Answer" in "Answers"
		And I update "answer_answer" field with text "BLAH BLAH" and click the button "Update"
		Then the message received is "Answer was successfully updated."

		And "Add an answer" is clicked
		And an answer is created with the text "Random thing"
		Then the message received is "Answer was successfully created."

		And I modify the "Random thing" by clicking "Delete Answer" in "Answers"
		Then the message received is "Answer was successfully deleted."

		And "All Questions" is clicked
		And I modify the "Sample Question?" by clicking "Edit Question" in "Questions"
		And I update "question_question" field with text "BLAH GAHH" and click the button "Update"
		Then the message received is "Question was successfully updated."

		And I modify the "BLAH GAHH" by clicking "Delete Q&A" in "Questions"
		Then the message received is "Question was successfully deleted."

		And I modify the "Sample Question2?" by clicking "Delete Q&A" in "Questions"
		Then the message received is "Question was successfully deleted."