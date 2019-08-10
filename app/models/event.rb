class Event < ApplicationRecord
  validates :name, presence: true, length: { in: 1..30 }
  validates :kind, presence: true
  validates :start_on, presence: true
  validates :price, presence: true,
             format: { with: /\A[0-9]+\z/}
  validates :game, presence: true,
             format: { with: /\A[0-9]+\z/}
  validates :lane, presence: true, numericality: {less_than_or_equal_to: 36},
             format: { with: /\A[0-9]+\z/}
  validates :remarks, length: { maximum: 300 }

  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy

  mount_uploader :image, ImageUploader

  #simple_calendar
  def start_time
    self.start_on
  end
  
  #datetime型のカラムをdateで日付検索可能にする
  ransacker :start_on do
    Arel.sql "date(events.start_on)"
  end

  #rails_adminのcreateアクションカスタマイズ
  rails_admin do
    create do
      field :kind, :enum do
        enum_method do
          :kind_enum
        end
      end
    end
  end

  rails_admin do
    create do
      field :name
      field :start_on
      field :price
      field :game
      field :lane
      field :image
      field :remarks
      field :kind, :enum do
        enum do
          [['イベント','イベント'],['予約','予約']]
        end
      end
    end
  end

  #rails_adminのeditアクションカスタマイズ
  rails_admin do
    edit do
      field :kind, :enum do
        enum_method do
          :kind_enum
        end
      end
    end
  end

  rails_admin do
    edit do
      field :name
      field :start_on
      field :price
      field :game
      field :lane
      field :image
      field :remarks
      field :kind, :enum do
        enum do
          [['イベント','イベント'],['予約','予約']]
        end
      end
    end
  end
end
