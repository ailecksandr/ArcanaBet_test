# frozen_string_literal: true

require 'rails_helper'

describe Stocks::CompoundInterest do
  subject { described_class.call(stock_id: stock_id) }

  let(:user)     { create(:user) }
  let(:stock_id) { create(:stock, user: user).id }

  it 'generate hash' do
    expect(subject).to be_a(Hash)
  end
end
