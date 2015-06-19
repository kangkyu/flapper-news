class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  validates :title, presence: true
  validates :user, presence: true

  def as_json(options = {})
    super(options.merge(include: :comments))
  end
end
