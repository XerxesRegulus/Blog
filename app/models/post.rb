class Post < ActiveRecord::Base
  validates :title, :body, presence: true
  validates :title, :body, length: { minimum: 5 }
  validates :body, length: { maximum: 300 }
  validates :number, numericality: true

  has_many :comments
end
