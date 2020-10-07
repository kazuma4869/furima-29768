class PreManagement
  include ActiveModel::Model
  attr_accessor :house_code, :city, :house_address, :prefecture_id, :telephone, :item_id, :user_id
  
  with_options presence: true do
    validates :house_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end

  def save
    pre = Pre.create(house_code: house_code, city: city, house_address: house_address, prefecture_id:prefecture_id, telephone: telephone)
    User.create(user_id: user_id)
    Item.create(item_id: item_id)
  end
end
