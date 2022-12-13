# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Result, type: :model do
  include SeqHelper

  let(:str_params) { '6 3 5' }
  let(:num_params) { 3 }
  let(:params) {{ num: num_params, str: str_params }}
  it 'checking db: adding and selecting' do    
    elem = Result.new(params)
    expect(elem.save).to eq(true)
    expect(Result.find_by(str: str_params).nil?).to eq(false)
    Result.last.destroy
  end

  it 'not allowed adding existiing record' do
    rec = Result.find_by(str: '6 28 3 4 5 6 6 496 3 6')
    Result.create!(
      num: rec.num,
      str: rec.str,
      result: rec.result,
      longest: rec.longest,
      count: rec.count
    )
  end
end
