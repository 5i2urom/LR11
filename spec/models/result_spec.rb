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
      expect(described_class.find_by(str: str_params).nil?).to eq(false)
      described_class.last.destroy
    end
  end

  describe 'do smth' do
    let(:str_params2) { '6 28 3 4 5 6 6 496 3 6666' }
    let(:num_params2) { 10 }
    let(:params2) { { num: num_params2, str: str_params2 } }
    subject { described_class.create(params2) }
    it 'do' do
      #count_fill
      p subject
      expect(subject.count).to eq(2)
    end
  end

  # it 'not allowed adding existiing record' do
  #   rec = Result.find_by(str: '6 28 3 4 5 6 6 496 3 6')
  #   Result.create!(
  #     num: rec.num,
  #     str: rec.str,
  #     result: rec.result,
  #     longest: rec.longest,
  #     count: rec.count
  #   )
  # end
end
