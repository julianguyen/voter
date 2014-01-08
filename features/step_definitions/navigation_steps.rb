Given(/^I am on the Add Question page$/) do
  visit "/questions/new"
end

When(/^I create question with text "(.*?)"$/) do |question_text|
  fill_in "question_question", :with => question_text
  click_button('Create')
end

Then(/^I see message "(.*?)"$/) do |message|
  find(".notice").text.should ==  message
end

Given(/^I fill in "(.*?)" with (\d+)\-(\d+) characters$/) do |arg1, arg2, arg3|
  pending # express the regexp above with the code you wish you had
end

When(/^I press "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^the page should redirect to the "(.*?)" page with notice message "(.*?)"\.$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end
