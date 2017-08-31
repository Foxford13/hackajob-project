class ConversationSerializer < ActiveModel::Serializer
  attributes :id
  # has_many :messages
  # belongs_to :sender
  # belongs_to :receiver

  belongs_to :sender, class_name: "User", foreign_key: "sender_id"
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"
  has_many :messages, dependent: :destroy
  # belongs_to :item, optional: true




end
