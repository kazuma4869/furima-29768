class PreManagement
  include ActiveModel::Model
  attr_accessor :house_code, :city, :house_address, :prefecture_id, :telephone, :user_id, :item_id, :token, :house_name
  
  with_options presence: true do
    validates :house_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :token
    validates :prefecture_id, numericality: { other_than: 1 } 
    validates :city
    validates :house_address
    validates :telephone, length: {maximum:11}
  end

  def save
    premanagement = Management.create(user_id: user_id, item_id: item_id)
    Pre.create(house_name: house_name, house_code: house_code, city: city, house_address: house_address, prefecture_id:prefecture_id, telephone: telephone, management_id: premanagement.id)
  end
end
