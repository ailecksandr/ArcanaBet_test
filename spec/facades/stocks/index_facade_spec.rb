# frozen_string_literal: true

require 'rails_helper'

describe Stocks::IndexFacade do
  subject { described_class.new(user: resource, params: page_params) }

  let!(:resource)    { create(:user) }
  let!(:stocks)      { create_list(:stock, 20, user: resource) }
  let!(:page_params) { { page: 1 } }

  describe '#stocks' do
    let(:subject_stocks) { subject.stocks }

    it 'return an array of stocks' do
      expect(subject.stocks).to be_an(ActiveRecord::Relation)
    end

    it 'return an array of stocks with fixed amount' do
      expect(subject_stocks.count).to eq(Stocks::IndexFacade::PER_PAGE)
    end
  end

  describe '#pagination' do
    it 'should return pagination details object' do
      expect(subject.pagination).to be_a(Pagy)
    end
  end

  describe '#page_counter' do
    let!(:page_params) { { page: page } }
    let(:page)         { 2 }
    let(:page_counter) { (page - 1) * Stocks::IndexFacade::PER_PAGE + 1 }

    it 'should return starting counting number for page' do
      expect(subject.page_counter).to eq(page_counter)
    end
  end
end
