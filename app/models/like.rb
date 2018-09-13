class Like < ApplicationRecord
  validates :user_id, presence: true
  validates :blog_id, presence: true

  belongs_to :user
  belongs_to :blog, counter_cache: :likes_count
end
