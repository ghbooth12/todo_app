class Item < ActiveRecord::Base
  belongs_to :user
  has_many :completes, dependent: :destroy

  validates :name, length: { minimum: 1 }, presence: true
  validates :user, presence: true

  default_scope { order('created_at ASC') }
end
