class Message < ApplicationRecord
  scope :full_text_search, -> (query) {
    raise 'Argument of full_text_search method is array or string only' unless query.instance_of?(Array) || query.instance_of?(String)
    where("MATCH(message) AGAINST(? IN BOOLEAN MODE)", "+#{query}")
  }
end
