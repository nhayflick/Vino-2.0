class Vine < ActiveRecord::Base
  attr_accessible :url, :fallback_url, :from_user, :from_user_id, :profile_image_url, :tweeted_at, :text

  has_many :queried_vines
  has_many :queries, through: :queried_vines

  validates_uniqueness_of :fallback_url
end
