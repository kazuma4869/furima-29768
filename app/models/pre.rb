class Pre < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :management
  belongs_to_active_hash :prefecture
  attr_accessor :token

  validates :token, presence: true
  #validates :name, length: { maximum:40}
  #validates :explain, length: { maximum:1000}
  #validates :price, numericality: { greater_than:300,less_than:999999},format: /\A[0-9]+\z/
  #validates :status_id, numericality: { other_than: 1 } 
  #validates :category_id, numericality: { other_than: 1 } 
  #validates :fee_id, numericality: { other_than: 1 } 
  #validates :prefecture_id, numericality: { other_than: 1 } 
  #validates :shipment_id, numericality: { other_than: 1 } 
  #空の投稿を保存できないようにする
  #validates :name, :explain, :price, presence: true
  #ジャンルの選択が「--」の時は保存できないようにする
end
