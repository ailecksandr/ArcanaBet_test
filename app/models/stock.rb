# frozen_string_literal: true

class Stock < ApplicationRecord
  MIN_NAME_LENGTH = 3
  MAX_NAME_LENGTH = 20

  MIN_YEARS = 0
  MAX_YEARS = 100

  MIN_UNIT_PRICE = 0

  MIN_INTEREST = 0
  MAX_INTEREST = 1

  belongs_to :user, inverse_of: :stocks

  validates :name, presence: true, length: { minimum: MIN_NAME_LENGTH, maximum: MAX_NAME_LENGTH }

  validates :unit_price, presence: true, numericality: { greater_than: MIN_UNIT_PRICE }

  validates :interest, presence:     true,
                       numericality: { greater_than:          MIN_INTEREST,
                                       less_than_or_equal_to: MAX_INTEREST }

  validates :duration, presence:     true,
                       numericality: { greater_than: MIN_YEARS, less_than_or_equal_to: MAX_YEARS }
end
