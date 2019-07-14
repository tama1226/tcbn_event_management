class Event < ApplicationRecord
  validates :name, presence: true, length: { in: 1..50 }
  validates :kind, presence: true
  validates :start_on, presence: true
  validates :lane, presence: true

  #simple_calendar
  def start_time
    self.start_on
  end
  
  #datetime型のカラムをdateで日付検索可能にする
  ransacker :start_on do
    Arel.sql "date(events.start_on)"
  end
end
