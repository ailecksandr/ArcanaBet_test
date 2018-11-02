# frozen_string_literal: true

require 'rails_helper'

describe Stock, type: :model do
  it { should belong_to(:user) }

  it { should validate_presence_of(:name) }
  it {should validate_length_of(:name).is_at_least(3).is_at_most(20) }

  it { should validate_presence_of(:unit_price) }
  it { should validate_numericality_of(:unit_price).is_greater_than(0) }


  it { should validate_presence_of(:interest) }
  it { should validate_numericality_of(:interest) }

  it { should validate_presence_of(:duration) }
  it { should validate_numericality_of(:duration) }
end
