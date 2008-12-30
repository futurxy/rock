class Post
  include DataMapper::Resource
  
  property :id, Serial
  property :title, String, :nullable => false, :length => 10
  property :content, Text, :nullable => false, :length => 1000
  has n, :comments
  is :taggable
  belongs_to :user
end
