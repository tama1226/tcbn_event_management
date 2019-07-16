class Event < ApplicationRecord
  validates :name, presence: true, length: { in: 1..30 }
  validates :kind, presence: true
  validates :start_on, presence: true
  validates :price, presence: true,
             format: { with: /\A[0-9]+\z/}
  validates :game, presence: true
  validates :lane, presence: true, numericality: {less_than_or_equal_to: 36},
             format: { with: /\A[0-9]+\z/}
  validates :remarks, length: { maximum: 300 }

  has_many :comments, dependent: :destory

  #simple_calendar
  def start_time
    self.start_on
  end
  
  #datetime型のカラムをdateで日付検索可能にする
  ransacker :start_on do
    Arel.sql "date(events.start_on)"
  end
end
