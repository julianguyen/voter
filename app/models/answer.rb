class Answer < ActiveRecord::Base
	before_validation :strip_blanks
  	attr_accessible :answer, :counter, :questionid

    validates_length_of :answer, :minimum => 1, :maximum => 250
    validates_uniqueness_of :answer, :case_sensitive => false

    def strip_blanks
    	self.answer = self.answer.strip
  	end
end
