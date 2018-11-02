# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do
  it { should have_many(:stocks) }
end
