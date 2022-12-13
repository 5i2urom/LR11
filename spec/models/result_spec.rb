# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Result, type: :model do
  describe 'check add' do
    let(:str_params) { '6 3 5' }
    let(:num_params) { 3 }
    let(:params) { { num: num_params, str: str_params } }
    subject { described_class.new(params) }
    it 'checking db: adding and selecting' do
      expect(subject.save).to eq(true)
      expect(described_class.find_by(str: str_params).nil?).to eq(false)
    end
  end

  describe 'check right' do
    let(:str_params) { '6 28 3 4 5 6 6 496 3 66678' }
    let(:num_params) { 10 }
    let(:params) { { num: num_params, str: str_params } }
    subject { described_class.create(params) }
    it 'adds right data' do
      expect(subject.count).to eq(2)
      expect(subject.result).to eq(['6 28', '6 6 496'])
      expect(subject.longest).to eq('6 6 496')
    end
  end

  describe 'not allows repeatable records' do
    let(:str_params) { '6 28 3 4 5 6 6 496 3 6' }
    let(:num_params) { 10 }
    let(:params) { { num: num_params, str: str_params } }
    it 'adds right data' do
      subject = described_class.create(params)
      subject = described_class.create(params)
      expect(subject.errors.added?(:str, 'has already been taken')).to eq(true)
    end
  end
end
