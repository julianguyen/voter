class Question < ActiveRecord::Base
	before_validation :strip_blanks
	attr_accessible :question

	validates_length_of :question, :minimum => 1, :maximum => 250
	validates_uniqueness_of :question, :case_sensitive => false

  	def strip_blanks
    	self.question = self.question.strip
  	end

  	def self.duplicateQuestions(q)
  		return Question.where(:question => q.strip).exists? || Question.where(:question => q).exists?
  	end
end
