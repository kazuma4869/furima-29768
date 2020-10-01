class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipment
  belongs_to :user

  #validates :name, length: { maximum:40}
  #validates :explain, presence :true, length: { maximum:1000}
  #validates :price, presence :true, numericality: { greater_than:300,less_than:999999},format: /\A[0-9]+\z/
  #validates :status_id, numericality: { other_than: 1 } 
  #validates :categor_id, numericality: { other_than: 1 } 
  #validates :fee_id, numericality: { other_than: 1 } 
  #validates :prefecture_id, numericality: { other_than: 1 } 
  #validates :shipment_id, numericality: { other_than: 1 } 
  #空の投稿を保存できないようにする
  validates :name, :explain, :price, presence: true
  #ジャンルの選択が「--」の時は保存できないようにする
  validates :categor_id, numericality: { other_than: 1 } 
end
