class Message < ApplicationRecord
  has_many :users, through: :inboxes
  has_many :users, through: :outboxes

end
