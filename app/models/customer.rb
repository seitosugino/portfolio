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
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  attachment :image
  
  def follow(other_customer)
    following << other_customer
  end
  
  def unfollow(other_customer)
    active_relationships.find_by(followed_id: other_customer.id).destroy
  end
  
  def following?(other_customer)
    following.include?(other_customer)
  end
  
  def self.sort(selection)
    case selection
      when 'new'
        return all.order(created_at: :DESC)
      when 'old'
        return all.order(created_at: :ASC)
      when 'manypost'
        return find(Post.group(:customer_id).order('count(customer_id) desc').pluck(:customer_id))
      when 'fewpost'
        return find(Post.group(:customer_id).order('count(customer_id) asc').pluck(:customer_id))
      when 'manyfollower'
        return find(Relationship.group(:customer_id).order('count(follower_id) desc').pluck(:customer_id))
      when 'fewfollower'
        return find(Relationship.group(:customer_id).order('count(follower_id) asc').pluck(:customer_id))
    end
  end
  
end
