class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :introduction, presence: true
  attachment :image, destroy: false
  has_many :group_users
  has_many :customers, through: :group_users
  has_many :group_posts
  accepts_nested_attributes_for :group_users
end
