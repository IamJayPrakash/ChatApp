# frozen_string_literal: true

class Room < ApplicationRecord
  validates_uniqueness_of :name, presence: true
  scope :public_rooms, -> { where(is_private: false) }
  after_create_commit { broadcast_append_to 'rooms' }
  has_many :messages, dependent: :destroy
  has_many :participants, dependent: :destroy
  after_create_commit { broadcast_if_public }

  def broadcast_if_public
    broadcast_append_to 'rooms' unless is_private
  end

  def self.create_private_room(users, room_name)
    single_room = Room.create(name: room_name, is_private: true)
    users.each do |user|
      Participant.create(user_id: user.id, room_id: single_room.id)
    end
    single_room
  end
end
