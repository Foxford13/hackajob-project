class Item < ApplicationRecord
  belongs_to :user
    has_many :conversations, class_name: "Conversation", foreign_key: "item_id"
      mount_uploader :image, ImageUploader
      validates :title, presence: :true
      validates :short_description, presence: :true
      validates :full_description, presence: :true
      validates :super_type, presence: :true
      validates :sub_type, presence: :true
      validates :location, presence: :true
      validates :price, presence: :true
     has_and_belongs_to_many :watchers, class_name: "User", join_table: "items_users"

end
