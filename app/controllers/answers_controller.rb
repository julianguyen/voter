class AnswersController < ApplicationController
	
	def index
		@questionid = params[:questionid]
    	@answers = Answer.where(:questionid => params[:questionid]).all
  	end 

  	def new
  		@questionid = params[:questionid]
  		@theanswer = params[:answer]
  		@answer = Answer.new(answer: @theanswer, questionid: @questionid)

	  	respond_to do |format|
	      format.html # new.html.erb
	      format.json { render json: @answer }
	    end
  	end

  	def create
  		@questionid = params[:questionid]
    	@answer = Answer.new(params[:answer])

    	createQA("answer", @answer, @questionid)
 	 end

 	 def show
 	 	@answer = Answer.find(params[:id])

 	 	respond_to do |format|
      		format.html # show.html.erb
      		format.json { render json: @answer }
    	end

 	 end 

 	  def edit
 	  	 @questionid = params[:questionid]
 	  	 @type = params[:type]
   		 @answer = Answer.find(params[:id])
  	  end


 	def update
 		@type = params[:type]
	    @answer = Answer.find(params[:id])

	    respond_to do |format|
	      if @answer.update_attributes(params[:answer])
	        format.html { redirect_to answers_path(:questionid => Answer.getAnswers(params[:id])), notice: 'Answer was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: "edit" }
	        format.json { render json: answers_path(:questionid => Answer.getAnswers(params[:id])).errors, status: :unprocessable_entity }
	      end
	    end
	 end

	def destroy
	    @answer = Answer.find(params[:id])
	    @questionid = @answer.questionid
	    @answer.destroy
	    
	    respond_to do |format|
	      format.html { redirect_to answers_path(:questionid => @questionid), notice: 'Answer was successfully deleted.' }
	      format.json { head :no_content }
	    end
  	end

end


