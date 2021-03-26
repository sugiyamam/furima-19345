class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :delivery_price
  belongs_to :delivery_time
  belongs_to :prefecture
  belongs_to :status
  has_one :buy
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
  end

  with_options numericality: { other_than: 1, message: 'is invalid' } do
    validates :category_id
    validates :status_id
    validates :delivery_price_id
    validates :prefecture_id
    validates :delivery_time_id
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is invalid' }
end
