# frozen_string_literal: true

# the controller

class SeqController < ApplicationController
  include SeqHelper

  def input; end

  # rubocop:disable Metrics/AbcSize
  def show    
    @record = Result.new(seq_params)
    find_record ? get_data : @record.save
  end
  # rubocop:enable Metrics/AbcSize

  def show_all
    respond_to do |format|
      format.xml { render xml: Result.all }
    end
  end

  def seq_params
    params.permit(:num, :str)
  end
end
