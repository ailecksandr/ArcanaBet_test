# frozen_string_literal: true

class Stock < ApplicationRecord
  belongs_to :user, inverse_of: :stocks

  validates :name, presence: true, length: { maximum: 20, minimum: 3 }

  validates :unit_price, presence: true, numericality: { greater_than: 0 }
  validates :interest,   presence: true, numericality: { greater_than: 0, less_than: 100 }
  validates :duration,   presence: true, numericality: { greater_than: 0, less_than: 100 }
end
