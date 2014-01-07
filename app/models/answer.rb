class Answer < ActiveRecord::Base
  attr_accessible :answer, :counter, :questionid

    validates_length_of :answer, :minimum => 1, :maximum => 250
    validates :answer, :uniqueness => true
end
