class Query < ActiveRecord::Base
  attr_accessible :body, :response

  validates :body, presence: true
end
