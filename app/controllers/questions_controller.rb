class QuestionsController < ApplicationController
	
	def index
    	@questions = Question.all
  	end 

  	def new
  		@question = Question.new

	  	respond_to do |format|
	      format.html # new.html.erb
	      format.json { render json: @question }
	    end
  	end

  	def create
    	@question = Question.new(params[:question])

	    respond_to do |format|
	    	if Question.where(:question => @question.question.strip).exists?
    			format.html { redirect_to questions_path, notice: "This question already exists." }
    			format.json { render json: @question.errors, status: :unprocessable_entity }
	    	elsif @question.question == "" || @question.question == nil || @question.question.length < 0 || @question.question.length > 250
	    		format.html { redirect_to questions_path, notice: 'This question is not between 1-250 characters. ' + @question.question.to_s }
		    	format.json { render json: @question.errors, status: :unprocessable_entity }
		    elsif Question.where(:question => @question.question).exists?
		    	format.html { redirect_to questions_path, notice: 'This question already exists.'}
		    	format.json { render json: @question.errors, status: :unprocessable_entity }
	    	else 
		      if @question.save

		        format.html { redirect_to new_answer_path(:questionid => @question), notice: 'Question was successfully created.' }
		        format.json { render json: @question, status: :created, location: @question }
		      else
		        format.html { render action: "new" }
		        format.json { render json: @question.errors, status: :unprocessable_entity }
		      end
		    end 
	    end

 	 end

 	 def show
 	 	@question = Question.find(params[:id])

 	 	respond_to do |format|
      		format.html # show.html.erb
      		format.json { render json: @question }
    	end

 	 end 

 	  def edit
 	  	 @type = params[:type]
   		 @question = Question.find(params[:id])
  	  end


 	def update
 		@type = params[:type]
	    @question = Question.find(params[:id])

	    respond_to do |format|
	      if @question.update_attributes(params[:question])
	        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: "edit" }
	        format.json { render json: @question.errors, status: :unprocessable_entity }
	      end
	    end
	 end

	def destroy
	    @question = Question.find(params[:id])
	    @answer = Answer.where(:questionid => @question).all

	    @question.destroy
	    @answer.each do |a|
	    	a.destroy
	    end
	    
	    respond_to do |format|
	      format.html { redirect_to questions_path }
	      format.json { head :no_content }
	    end
  	end

end


