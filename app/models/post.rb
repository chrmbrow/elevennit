class Post < ActiveRecord::Base
  acts_as_commentable

  validates :title, length: { maximum: 255 }, presence: true
  validates :link, presence: true, if: :link?
  validates :link, length: { maximum: 2000 }
  validates :body, presence: true, if: :text?
  validates :category_id, presence: true
  enum post_type: [:link, :text]

  belongs_to :category
  belongs_to :user
  default_scope { order(:created_at => :desc) }
  scope :added_today, -> { where('created_at > ?', Time.now.beginning_of_day) }
  scope :with_categories, -> { includes(:category) }
  scope :with_users, -> {includes(:user)}

  self.per_page = 10
end
