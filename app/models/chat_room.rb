class ChatRoom < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :messages, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def last_message
    messages.order(created_at: :desc).first
  end

  def unread_messages?
    messages.where(viewed: false).exists?
  end

  def unread_count
    messages.where(viewed: false).count
  end
end
