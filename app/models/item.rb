class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category      
  belongs_to :delivery_price
  belongs_to :delivery_time
  belongs_to :prefecture
  belongs_to :status
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 1, message: "is invalid. Category Select."}
    validates :status_id, numericality: { other_than: 1, message: "is invalid. Status Select."}
    validates :delivery_price_id, numericality: { other_than: 1, message: "is invalid. Delivery Price Select."}
    validates :prefecture_id, numericality: { other_than: 1, message: "is invalid. Prefecture Select."}
    validates :delivery_time_id, numericality: { other_than: 1, message: "is invalid. Delivery Time Select."}
    validates :price
  end
    validates :price, format: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid. Price Out of setting range"}
end