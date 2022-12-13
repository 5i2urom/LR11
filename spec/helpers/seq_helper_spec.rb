# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SeqHelper, type: :helper do
  it 'returns different results' do
    my_seq1 = '2 3 4 6 6 6 496 5 28 28 496 3 496'
    expect(helper.perfect(my_seq1)).to eq([['6 6 6 496', '28 28 496', '496'], 3])

    my_seq2 = '1 1 1 5 496'
    expect(helper.perfect(my_seq2)).to eq([['496'], 1])
  end
end
