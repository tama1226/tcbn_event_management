class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true, length: { in: 1..30 }
  validates :phone_number, allow_blank: true,
             format: { with: /\A\d{10,11}\z/ }
  validates :email, presence: true, length: { minimum: 6 },
             uniqueness: true,
             format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
end
