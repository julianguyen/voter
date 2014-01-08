class VotesController < ApplicationController

	def index
		@questions = Question.all
	end

	def vote
		@questionid = params[:questionid]
		@answers = Answer.where(:questionid => @questionid).all 
  	end

  	def voting
  		@ans = params[:ans]
  		if Answer.where(:id => @ans).exists?
  			@addcounter = Answer.where(:id => @ans).first.counter.to_i + 1
  			@updateanswer = Answer.find(@ans)

  			respond_to do |format|
		    	if @updateanswer.update_attributes(:counter => @addcounter)
		        	format.html { redirect_to voted_votes_path(:questionid => @updateanswer.questionid), notice: 'You have voted.' }
		        	format.json { head :no_content }
		      	else
		        	format.html { render action: "edit" }
		        	format.json { render json: @updateanswer.errors, status: :unprocessable_entity }
		      	end
    		end
  		else
  			redirect_to vote_votes_path(:questionid => params[:questionid]), notice: 'You have to vote for something...' 	
  		end
  	end

  	def voted
  		@questionid = params[:questionid]
  		@answers = Answer.where(:questionid => @questionid).all
  	end 

end
