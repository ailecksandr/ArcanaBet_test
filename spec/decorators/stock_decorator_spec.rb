# frozen_string_literal: true

require 'rails_helper'

describe StockDecorator do
  subject { described_class.new(resource) }

  let(:resource) { build_stubbed(:stock) }

  describe '#interest' do
    let(:interest) { resource.interest }
    let(:result)   { sprintf('%.2f%%', interest * StockDecorator::PERCENTS) }

    it { expect(subject.interest(human: true)).to eq(result) }
    it { expect(subject.interest).to              eq(interest) }
  end
end
