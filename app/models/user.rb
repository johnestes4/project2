class User < ApplicationRecord
  has_many :messages, through: :inboxes
  has_many :messages, through: :outboxes
end
