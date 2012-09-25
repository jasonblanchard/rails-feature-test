class Post < ActiveRecord::Base
  attr_accessible :content, :name, :title, :tags_attributes, :user_id

  validates :title, :presence => true,
            :length => { :minimum => 5 }
  
  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_many :tags
  has_many :revisions

  accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? }}

  def author
    @author_id = user_id
    @author = User.find(@author_id).email
  end 

  def owned_by?(owner)
    return false unless owner.is_a? User
    user == owner
  end
end
