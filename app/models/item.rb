class Item < ApplicationRecord
  blong_to :user

  validates :name, presence :true, length: { maximum:40}
  validates :explain, presence :true, length: { maximum:1000}
  validates :price, presence :true, numericality: { greater_than:300,less_than:999999},format: /\A[0-9]+\z/
  validates :categor_id, presence :true
  validates :status_id, presence :true
  validates :fee_id, presence :true
  validates :prefecture_id, presence :true
  validates :shipment_id, presence :true
end
