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
  has_many :group_posts, dependent: :destroy
  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users
  has_many :items, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :item_likes, dependent: :destroy
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

  def self.search(search)
    if search
      Customer.where(['name LIKE ?', '%'+search+'%'])
    else
      Customer.all
    end
  end

  def self.sort(selection)
    case selection
      when 'new'
        return all.order(created_at: :DESC)
      when 'old'
        return all.order(created_at: :ASC)
      when 'manypost'
        return left_joins(:posts).group("customers.id").order('count(posts.id) desc')
      when 'fewpost'
        return left_joins(:posts).group("customers.id").order('count(posts.id) asc')
      when 'manyfollower'
        return left_joins(:passive_relationships).group("customers.id").order("count(relationships.id) desc")
      when 'fewfollower'
        return left_joins(:passive_relationships).group("customers.id").order("count(relationships.id) asc")
      when 'manylikes'
        # likesもleft_joinsしようとするとcustomerと紐づくためjoinsで直接SQLを記載
        return joins("LEFT OUTER JOIN posts ON customers.id = posts.customer_id LEFT OUTER JOIN likes ON posts.id = likes.post_id").group("posts.id").order("count(likes.id) desc")
      when 'fewlikes'
        return joins("LEFT OUTER JOIN posts ON customers.id = posts.customer_id LEFT OUTER JOIN likes ON posts.id = likes.post_id").group("posts.id").order("count(likes.id) asc")
    end
  end

end
