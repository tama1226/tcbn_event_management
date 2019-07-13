class Contact < ApplicationRecord
  validates :reserved_name, presence: true, length: { in: 1..20 }
  validates :name, presence: true, length: { in: 1..20 }
  validates :phone_number, presence: true
  validates :email, presence: true, length: { minimum: 6 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :reserved_on, presence: true
  validates :lane, presence: true
end
