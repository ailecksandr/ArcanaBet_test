# frozen_string_literal: true

describe Stocks::Create do
  subject { described_class.call(user: user, params: params) }

  let(:user)   { create(:user) }
  let(:params) { attributes_for(:stock) }

  context 'with valid params' do
    it { expect{ subject }.to change(Stock, :count) }
  end
end
