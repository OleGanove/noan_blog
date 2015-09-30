class Post < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true
  
  extend FriendlyId
  friendly_id :title, use: :slugged
end
