class Comment < ApplicationRecor
  belongs_to :event
  belongs_to :user
end
