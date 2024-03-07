class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :user_nationalities, dependent: :destroy
  has_many :nationalities, through: :user_nationalities
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :restaurants, through: :bookmarks
  has_many :followers, dependent: :destroy
end
