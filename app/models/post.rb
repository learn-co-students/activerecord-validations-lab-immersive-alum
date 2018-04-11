class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w[Fiction Non-Fiction] }
  validate :clickbait
  
  def clickbait
    title =~ (/Won\'t Believe|Top [0-9]*|Secret|Guess/) ? true : errors.add(:title, "Must be clickbait")
  end
end
