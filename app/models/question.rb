class Question < ActiveRecord::Base
  attr_accessible :question

  validates_length_of :question, :minimum => 1, :maximum => 250
end
