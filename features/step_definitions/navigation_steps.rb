Given(/^I am on the Add Question page$/) do
  visit "/questions/new"
end

When(/^I create question with text "(.*?)"$/) do |question_text|
  fill_in "question_question", :with => question_text
  click_button('Create')
end

When(/^I see message "(.*?)"$/) do |message|
  find(".notice").text.should ==  message
end

When(/^an answer is created with the text "(.*?)"$/) do |answer_text|
  fill_in "answer_answer", :with => answer_text
  click_button('Add')
end

Then(/^the message received is "(.*?)"$/) do |message|
  find(".notice").text.should ==  message  
end

When(/^I click on the Question page$/) do
  visit "/questions"
end

When(/^"(.*?)" is clicked and "(.*?)" is clicked$/) do |arg1, arg2|
  click_link(arg1)
  click_link(arg2)
end