class Pre < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :management
  belongs_to_active_hash :prefecture
  attr_accessor :token

  validates :token, presence: true
  validates :number, presence: true
  validates :exp_month, presence: true
  validates :exp_year, presence: true
  validates :cvc, presence: true
  validates :house_code presence: true
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :city, presence: true
  validates :house_address, presence: true
  validates :telephone, presence:true
end
