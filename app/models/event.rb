class Event < ApplicationRecord
  validates :name, presence: true, length: { in: 1..50 }
  #validates :kind, presence: true
  validates :start_on, presence: true
  validates :lane, presence: true
end
