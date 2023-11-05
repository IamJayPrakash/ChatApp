# frozen_string_literal: true

class User < ApplicationRecord
  validates :username, presence: true, format: { with: /\A[a-zA-Z0-9_\s.']+\z/ }, uniqueness: { case_sensitive: false }
  # validates_presence_of :email
  validates_uniqueness_of :email, presence: true

  scope :all_except, ->(user) { where.not(id: user) }
  after_create_commit { broadcast_append_to 'users' }
  has_many :messages, dependent: :destroy
end
