class Post < ApplicationRecord
  belongs_to :customer
  belongs_to :tag
  attachment :title_image
  attachment :body_image
  acts_as_taggable
  
  def self.search(search)
    if search
      Post.where(['name LIKE ?', '%'+search+'%'])
    else
      Post.all
    end
  end
end
