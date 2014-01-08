Feature: Add question
    In order to create a question, the user must fill in the form

    Scenario: Creates a valid question
        Given I am on the Add Question page
        When I create question with text "Sample Question?"
        Then I see message "Question was successfully created."