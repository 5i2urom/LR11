# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Result, type: :model do
  let(:str_params) { '6 3 5' }
  let(:num_params) { 3 }
  let(:params) {{ num: num_params, str: str_params }}
  it 'checking db: adding and selecting' do    
    elem = Result.new(params)
    expect(elem.save).to eq(true)
    expect(Result.find_by(str: str_params).nil?).to eq(false)
    Result.last.destroy
  end
end
