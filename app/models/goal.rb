class Goal < ActiveRecord::Base
  attr_accessible :completed, :private, :description, :user_id

  belongs_to :user
end
