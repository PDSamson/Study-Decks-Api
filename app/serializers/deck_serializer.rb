class DeckSerializer < ActiveModel::Serializer
  attributes :id, :title, :answer
  has_one :user
end
