class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :firstname, :lastname, :image, :image_src
  has_many :items
  has_many :conversations_sent
  has_many :conversations_received
  has_many :messages
  has_many :items_watched
  def image_src
    object.image.url
  end
end
