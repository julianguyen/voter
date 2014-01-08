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

	    respond_to do |format|
	    	if Answer.where(:answer => @answer.answer.strip).exists?
    			format.html { redirect_to answers_path(:questionid => @answer.questionid), notice: "This answer already exists." }
    			format.json { render json: @question.errors, status: :unprocessable_entity }
	    	elsif @answer.answer == "" || @answer.answer.length > 250
	    		format.html { redirect_to answers_path(:questionid => @answer.questionid), notice: 'This answer is not between 1-250 characters.'}
		    	format.json { render json: @answer.errors, status: :unprocessable_entity }
		    elsif Answer.where(:answer => @answer.answer).exists?
		    	format.html { redirect_to answers_path(:questionid => @answer.questionid), notice: 'This answer already exists.'}
		    	format.json { render json: @answer.errors, status: :unprocessable_entity }
		    else 
		      if @answer.save
		        format.html { redirect_to answers_path(:questionid => Answer.where(:id => @answer).first.questionid), notice: 'Answer was successfully created.' }
		        format.json { render json: answers_path(:questionid => Answer.where(:id => @answer).first.questionid), status: :created, location: answers_path }
		      else
		        format.html { render action: "new" }
		        format.json { render json: answers_path(:questionid => Answer.where(:id => @answer).first.questionid).errors, status: :unprocessable_entity }
		      end
		    end 
	    end

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
	        format.html { redirect_to answers_path(:questionid => Answer.where(:id => params[:id]).first.questionid), notice: 'Answer was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: "edit" }
	        format.json { render json: answers_path(:questionid => Answer.where(:id => params[:id]).first.questionid).errors, status: :unprocessable_entity }
	      end
	    end
	 end

	def destroy
	    @answer = Answer.find(params[:id])
	    @questionid = @answer.questionid
	    @answer.destroy
	    
	    respond_to do |format|
	      format.html { redirect_to answers_path(:questionid => @questionid) }
	      format.json { head :no_content }
	    end
  	end

end


