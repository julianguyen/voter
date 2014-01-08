Feature: Add question
    In order to create a question, the user must fill in the form

    Scenario: Creates a valid question
        Given I am on the Add Question page
        When I create question with text "Sample Question?"
        When I see message "Question was successfully created."
		When an answer is created with the text "Random answer"
		When the message received is "Answer was successfully created."
		When I click on the Question page
		When "Answers" is clicked and "Add an answer" is clicked
		When an answer is created with the text "Random thing"
		Then the message received is "Answer was successfully created."