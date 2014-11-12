class Category < ActiveRecord::Base
  validates :name, length: {maximum: 20}, presence: true
  validates :title, length: {maximum: 100}
  validates :description, length: {maximum: 500}
  validates :sidebar, length: {maximum: 5120}
  validates :submission_text, length: {maximum: 1024}

  has_many :posts
  default_scope { order(:name) }
  scope :added_today, -> { where('created_at > ?', Time.now.beginning_of_day) }
  scope :redundant_find, -> (id) { where(id: id) }
end
