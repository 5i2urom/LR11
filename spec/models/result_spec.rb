# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Result, type: :model do
  include SeqHelper

  describe 'do 1' do
    let(:str_params) { '6 3 5' }
    let(:num_params) { 3 }
    let(:params) { { num: num_params, str: str_params } }
    subject { described_class.new(params) }
    it 'checking db: adding and selecting' do
      expect(subject.save).to eq(true)
      p subject
      expect(described_class.find_by(str: str_params).nil?).to eq(false)
      described_class.last.destroy
    end
  end

  describe 'do smth' do
    let(:str_params) { '6 28 3 4 5 6 6 496 3 6666' }
    let(:num_params) { 10 }
    let(:params) { { num: num_params, str: str_params } }
    subject { Result.create(params) }
    it 'do' do
      expect(subject.count).to eq(2)
      expect(subject.result).to eq(["6 28", "6 6 496"])
      expect(subject.longest).to eq("6 6 496")
    end
  end


end
