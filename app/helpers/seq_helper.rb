# frozen_string_literal: true

# operates with a sequence
module SeqHelper
  def seq = params[:str]#.chomp.split(' ').map(&:to_i)

  def len = params[:num]

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def perfect(seq_str)
    seq = seq_str.chomp.split(' ').map(&:to_i)
    count = 0
    all_seqs = []
    curr_seq = []
    match = false
    seq.each_index do |ind|
      num = seq[ind]
      sum = 0
      1.upto(num / 2) do |del| # проверяем, является ли num совершенным числом
        sum += del if (num % del).zero?
      end
      if (num == sum) & (num != 0) # если совершенное
        curr_seq.push(num.clone)
        match = true
      elsif match
        all_seqs.push(curr_seq.clone.join(' '))
        curr_seq.clear
        match = false
        count += 1
      end
    end

    if match
      all_seqs.push(curr_seq.clone.join(' '))
      curr_seq.clear
      match = false
      count += 1
    end
    [all_seqs, count] # массив строк и число
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  def find_record = Result.find_by(str: seq)

  def get_data
    this_record = find_record
    @all_seqs = this_record.result
    @longest = this_record.longest
    @count = this_record.count
  end

  def insert_data
    Result.create(
      num: len,
      str: seq,
      result: @all_seqs,
      longest: @longest,
      count: @count
    )
  end

  # def mas = perfect(seq)

  # def result = mas[0]
  # def longest = result.max { |s1, s2| s1.split(' ').length <=> s2.split(' ').length }
  # def count = mas[1]

  def result
    perfect(self.str)[0]
  end

  def count_fill = perfect(self.str)[1]
end
