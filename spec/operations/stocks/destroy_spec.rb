# frozen_string_literal: true

require 'rails_helper'

describe Stocks::Destroy do
  subject { described_class.call(stock_id: stock_id) }

  let(:user)     { create(:user) }
  let!(:stock_id) { create(:stock, user: user).id }

  context 'with valid params' do
    it { expect{ subject }.to change(Stock, :count) }
  end
end
