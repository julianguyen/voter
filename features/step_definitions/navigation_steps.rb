Given(/^I am on the Add Question page$/) do
  visit "/questions/new"
end

And(/^I update "(.*?)" field with text "(.*?)" and click the button "(.*?)"$/) do |field, text, button|
  fill_in field, :with => text
  click_button(button)
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

Then(/^I edit the "(.*?)" by clicking "(.*?)" in "(.*?)"$/) do |arg1, arg2, arg3|
  if arg3 == "Answers"
    element = find(".answerRow .answer", :text => arg1) 
    if arg2 == "Edit Answer"
      element.find(".editAnswer").click
    elsif arg2 == "Delete Answer"
      element.find(".delete").click
    end
  elsif arg3 == "Questions"
    element = find(".questionRow .question", :text => arg1) 
    if arg2 == "Edit Question"
      element.find(".editQuestion").click
    elsif arg2 == "Answers"
      element.find(".answers").click
    elsif arg2 == "Delete Q&A"
      element.find(".delete").click
    end
  end
end