class Pre < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :management
  belongs_to_active_hash :prefecture
end
