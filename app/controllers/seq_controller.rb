class SeqController < ApplicationController
  include SeqHelper

  def input
  end

  def show
    @seq = params[:str_input].chomp.split(' ').map(&:to_i)
    @len = params[:num_input]
    
    @check_params = Result.new(seq_params)

    # if false #seq_exists?
    # else
        mas = perfect(@seq) # массив строк и число
        @all_seqs = mas[0]
        @count = mas[1]
        @longest = @all_seqs.max{|s1, s2| s1.split(' ').length <=> s2.split(' ').length}
        @record = insert_data
        
    # end
  end

  def seq_params
    params.permit(:num, :str)
  end

end
