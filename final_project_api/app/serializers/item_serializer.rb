class ItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :brand, :super_type, :sub_type, :short_description, :price, :full_description, :location, :image_src, :image, :watcher_ids
  belongs_to :user
has_many :watchers
  def image_src
    object.image.url
  end
end
