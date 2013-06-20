class QueriedVine < ActiveRecord::Base
  attr_accessible :query_id, :vine_id

  belongs_to :vine
  belongs_to :query

  validates :query_id, :vine_id, :presence => true
  validates :query_id, :uniqueness => {:scope => :vine_id}
end
