# frozen_string_literal: true

class Stock < ApplicationRecord
  belongs_to :user, inverse_of: :stocks

  validates :name,       presence: true
  validates :unit_price, presence: true
  validates :interest,   presence: true
  validates :duration,   presence: true
end
