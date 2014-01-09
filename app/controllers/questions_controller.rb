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

    	createQA("question", @question, "", @question.question)

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
	        format.html { redirect_to questions_path, notice: 'Question was successfully updated.' }
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
	      format.html { redirect_to questions_path, notice: 'Question was successfully deleted.' }
	      format.json { head :no_content }
	    end
  	end

end


