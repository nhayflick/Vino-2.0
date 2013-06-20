class Query < ActiveRecord::Base
  attr_accessible :body, :response

  has_many :queried_vines
  has_many :vines, through: :queried_vines
  accepts_nested_attributes_for :vines

  validates :body, presence: true

  def parse_response
    response = []
    self.response.each do |tweet|
      unless tweet.urls.length < 1 || Vine.find_by_fallback_url(tweet.urls[0].expanded_url)
        response << {
          fallback_url: tweet.urls[0].expanded_url,
          tweeted_at: tweet.created_at,
          from_user: tweet.from_user,
          from_user_id: tweet.from_user_id,
          profile_image_url: tweet.profile_image_url,
          text: tweet.text
        } 
      end
    end
  return response
  end
end