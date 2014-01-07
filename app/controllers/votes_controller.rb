class VotesController < ApplicationController

	def edit
 	  	 @questionid = params[:questionid]
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

end
