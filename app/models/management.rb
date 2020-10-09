class Management < ApplicationRecord
  
  belongs_to :item
  belongs_to :user
  has_one :pre
  
end
