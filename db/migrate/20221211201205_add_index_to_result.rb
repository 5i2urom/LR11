class AddIndexToResult < ActiveRecord::Migration[7.0]
  def change
    add_index :results, :str
  end
end
