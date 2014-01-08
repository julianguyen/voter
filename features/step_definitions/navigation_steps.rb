Given(/^I am on the Add Question page$/) do
  visit "/questions/new"
end

And(/^I "(.*?)" question with text "(.*?)"$/) do |action, question_text|
  fill_in "question_question", :with => question_text
  click_button(action)
end

And(/^I see message "(.*?)"$/) do |message|
  find(".notice").text.should ==  message
end

And(/^an answer is created with the text "(.*?)"$/) do |answer_text|
  fill_in "answer_answer", :with => answer_text
  click_button('Add')
end

Then(/^the message received is "(.*?)"$/) do |message|
  find(".notice").text.should ==  message  
end

When(/^I click on the Question page$/) do
  visit "/questions"
end

And(/^"(.*?)" is clicked$/) do |arg1|
  click_link(arg1)
end

Given(/^"(.*?)" is entered and "(.*?)" is clicked$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end