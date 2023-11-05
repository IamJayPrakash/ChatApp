# frozen_string_literal: true

class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :room
end
