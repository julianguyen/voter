module ApplicationHelper
	def createQA(type, data1, data2, data3)
		if type == "question"
			path1 = questions_path
		elsif type == "answers"
			path1 = answers_path(:questionid => data1.questionid)
			path2 = answers_path(:questionid => Answer.getAnswers(data1))
		end

		respond_to do |format|
	    	if type == "question" && Question.duplicateQuestions(data1.question)
    			format.html { redirect_to path1, notice: "This " + type +" already exists." }
    			format.json { render json: data1.errors, status: :unprocessable_entity }
    		elsif type == "answer" && Answer.duplicateAnswers(data2,data1.answer)
    			format.html { redirect_to path1, notice: "This " + type + " already exists." }
    			format.json { render json: data1.errors, status: :unprocessable_entity }
	    	elsif data3 == "" || data3 == nil || data3.length < 0 || data3.length > 250
	    		format.html { redirect_to path1, notice: 'This ' + type + ' is not between 1-250 characters.' }
		    	format.json { render json: data1.errors, status: :unprocessable_entity }		
	    	else 
		      if data1.save
		      	if type == "question"
		        	format.html { redirect_to new_answer_path(:questionid => data1), notice: 'Question was successfully created.' }
		        	 format.json { render json: data1, status: :created, location: data1 }
		        elsif type == "answer"
		        	format.html { redirect_to answers_path(:questionid => Answer.getAnswers(data1)), notice: 'Answer was successfully created.' }
		        	format.json { render json: answers_path(:questionid => Answer.getAnswers(data1)), status: :created, location: answers_path }
		        end
		      else
		        format.html { render action: "new" }
		        if type == "question"
		        	format.json { render json: data1.errors, status: :unprocessable_entity }
		        elsif type == "answer"
					format.json { render json: path2.errors, status: :unprocessable_entity }
		        end 
		      end
		    end 
		end
	end 
end
