class Revision < ActiveRecord::Base
  belongs_to :post
  attr_accessible :content, :created_at
end
