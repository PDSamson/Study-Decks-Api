class CardSerializer < ActiveModel::Serializer
  attributes :id, :question
  has_one :deck
end
