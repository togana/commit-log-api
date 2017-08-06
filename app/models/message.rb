class Message < ApplicationRecord
  scope :full_text_search, -> (query) {
    query = query.values unless query.instance_of?(Array) || query.instance_of?(String)
    where("MATCH(message) AGAINST(? IN BOOLEAN MODE)", "+#{query}")
  }
end
