class CardSerializer < ActiveModel::Serializer
  attributes :id, :question, :answer
  has_one :deck
end
