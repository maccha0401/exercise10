class Blog < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true
  
  belongs_to :user
  has_many :likes, dependent: :destroy
end
