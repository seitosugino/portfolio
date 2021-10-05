class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship",foreign_key: "follower_id",dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",foreign_key: "followed_id",dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  attachment :image
  
  def follow(other_customer)
    following << other_customer
  end
  
  def unfollow
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
  
  def following?(other_customer)
    following.include?(other_customer)
  end
  
end
