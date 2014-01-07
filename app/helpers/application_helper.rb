module ApplicationHelper
	def answerSplit(ans)
		  temp = nil
		  ans = ans.to_s + "$"
		  ans.each_char do |a|
		  	if a == "~" || a == "$" 
		  		puts temp
		  		temp = nil
		  	else
		  		if temp == nil
		  			temp = a
		  		else
		  			temp = temp + a
		  		end 
		  	end 
		  end 
	end
end
