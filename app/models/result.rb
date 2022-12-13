# frozen_string_literal: true

class Result < ApplicationRecord
  include ActiveModel::Serializers::Xml
  include SeqHelper
  validates :num, :str, presence: { message: ' не может быть пустым' }
  validates :num, format: { with: /\A\d+\z/, message: 'должно быть натуральным числом' }
  validates :str, uniqueness: true,
                  format: { with: /\A-?\d+(\d+)?(\s-?\d+(\d+)?)*\s*\z/,
                            message: 'должно быть последовательностью чисел' }
  def length_valid?
    errors.add(:str, " : длина не равна #{num}") if str.split(' ').length != num.to_i
  end

  validate :length_valid?

  before_save :fill_others

  def fill_others
    mas = perfect(str)
    self.result = mas[0]
    self.count = mas[1]
    self.longest = result.max { |s1, s2| s1.split(' ').length <=> s2.split(' ').length }
  end
end
