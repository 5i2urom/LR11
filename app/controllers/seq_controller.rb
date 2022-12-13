# frozen_string_literal: true

# the controller

class SeqController < ApplicationController
  include SeqHelper

  def input; end

  def show
    @record = Result.new(seq_params)
    find_record ? get_data : @record.save
  end

  def show_all
    respond_to do |format|
      format.xml { render xml: Result.all }
    end
  end

  private

  def seq_params
    params.permit(:num, :str)
  end
end
