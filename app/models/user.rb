class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { maximum: 40 }
  validates :email, presence: true
  validates :password, presence: true, format: { with: /\A[a-z\d]{6,100}+\z/i, message: "is invalid. Input full-width katakana characters." }
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :kana_family_name, presence: true
  validates :kana_first_name, presence: true
  validates :date_of_birth, presence: true
end
