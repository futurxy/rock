class Post
  include DataMapper::Resource
  
  property :id, Serial
  has n, :comments
  belongs_to :user
end
