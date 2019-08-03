class Contact < ApplicationRecord
  validates :reserved_name, presence: true, length: { in: 1..30 }
  validates :name, presence: true, length: { in: 1..20 }
  validates :phone_number, presence: true,
             format: { with: /\A\d{10,11}\z/ }
  validates :email, presence: true, length: { minimum: 6 },
             uniqueness: true,
             format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :number_of_people,
             format: { with: /\A[0-9]+\z/}
  validates :lane, presence: true, numericality: {less_than_or_equal_to: 36},
             format: { with: /\A[0-9]+\z/}
  validates :remarks, length: { maximum: 300 }
end
