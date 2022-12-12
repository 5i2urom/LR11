class SeqController < ApplicationController
  include SeqHelper

  def input
  end

  def show
    @seq = params[:str].chomp.split(' ').map(&:to_i)
    @len = params[:num]
    
    @record = Result.new(seq_params)

    #if seq_exists? then get_data
    if find_record
        get_data
        @record.save
    else
        mas = perfect(@seq) # массив строк и число
        @all_seqs = mas[0]         
        @longest = @all_seqs.max{|s1, s2| s1.split(' ').length <=> s2.split(' ').length}
        @count = mas[1]
        @record = insert_data        
    end
  end

  def seq_params
    params.permit(:num, :str)
  end

end
