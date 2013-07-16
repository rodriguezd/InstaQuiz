class Answer < ActiveRecord::Base
  attr_accessible :choice_id, :user_id

  belongs_to :choice
  belongs_to :user
end