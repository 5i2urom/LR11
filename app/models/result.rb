# frozen_string_literal: true

class Result < ApplicationRecord    
    validates :num, format: { with: /\A\d+\z/, message: 'should be a natural nubmer' }
    validates :str, #uniqueness: true,
              format: { with: /\A-?\d+(\d+)?(\s-?\d+(\d+)?)*\s*\z/,
                        message: 'should be a sequence of numbers' }
    def length_valid?
        errors.add(:str, "doesn't have length #{num}") if str.split(' ').length != num.to_i
    end

    validate :length_valid?
end
