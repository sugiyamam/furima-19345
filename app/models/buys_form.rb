class BuysForm
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :nickname, :postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality: { other_than: 1, message: "Select" }
    validates :municipality
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "Input only half-width number" }
    validates :item_id
    validates :user_id

  end
  
  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Delivery.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, house_number: house_number, building_name: building_name, phone_number: phone_number, buy_id: buy.id)
  end
end
