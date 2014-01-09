module ApplicationHelper
	def createQA(type, data1, data2)
		if type == "question"
			respond_to do |format|
		    	if Question.duplicateQuestions(data1.question)
	    			format.html { redirect_to questions_path, notice: "This question already exists." }
	    			format.json { render json: data1.errors, status: :unprocessable_entity }
		    	elsif data1.question == "" || data1.question == nil || data1.question.length < 0 || data1.question.length > 250
		    		format.html { redirect_to questions_path, notice: 'This question is not between 1-250 characters. ' + data1.question.to_s }
			    	format.json { render json: data1.errors, status: :unprocessable_entity }
		    	else 
			      if data1.save

			        format.html { redirect_to new_answer_path(:questionid => data1), notice: 'Question was successfully created.' }
			        format.json { render json: data1, status: :created, location: data1 }
			      else
			        format.html { render action: "new" }
			        format.json { render json: data1.errors, status: :unprocessable_entity }
			      end
			    end 
			end
		elsif type == "answer"
			respond_to do |format|
		    	if Answer.duplicateAnswers(data2,data1.answer)
	    			format.html { redirect_to answers_path(:questionid => data1.questionid), notice: "This answer already exists." }
	    			format.json { render json: @question.errors, status: :unprocessable_entity }
		    	elsif data1.answer == "" || data1.answer.length > 250
		    		format.html { redirect_to answers_path(:questionid => data1.questionid), notice: 'This answer is not between 1-250 characters.'}
			    	format.json { render json: data1.errors, status: :unprocessable_entity }
			    else 
			      if data1.save
			        format.html { redirect_to answers_path(:questionid => Answer.getAnswers(data1)), notice: 'Answer was successfully created.' }
			        format.json { render json: answers_path(:questionid => Answer.getAnswers(data1)), status: :created, location: answers_path }
			      else
			        format.html { render action: "new" }
			        format.json { render json: answers_path(:questionid => Answer.getAnswers(data1)).errors, status: :unprocessable_entity }
			      end
			    end 
	    	end
	    end
	end 
end
