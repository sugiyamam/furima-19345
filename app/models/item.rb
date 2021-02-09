class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category      
  belongs_to :delivery_price
  belongs_to :delivery_time
  belongs_to :prefecture
  belongs_to :status
  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :delivery_price_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_time_id, presence: true 
  
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :delivery_price_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :delivery_time_id, numericality: { other_than: 1 }
  validates :price, numericality: { greater_than_or_equal_to: 300 }
end