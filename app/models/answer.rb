class Answer < ActiveRecord::Base
	before_validation :strip_blanks
  	attr_accessible :answer, :counter, :questionid

    validates_length_of :answer, :minimum => 1, :maximum => 250
    validates_uniqueness_of :answer, :case_sensitive => false, :scope => :questionid # Given same quesitonid, the answer must be unique

    def strip_blanks
    	self.answer = self.answer.strip
  	end

  	def self.duplicateAnswers(q,a)
  		return Answer.where(:questionid => q, :answer => a.strip).exists? || Answer.where(:questionid => q, :answer => a).exists?
  	end

  	def self.getAnswers(a)
  		return Answer.where(:id => a).first.questionid
  	end
end
