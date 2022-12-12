# frozen_string_literal: true

class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.string :num, null: false
      t.string :str, null: false
      t.string :result, array: true
      t.string :longest
      t.integer :count, null: false, default: 0

      t.timestamps
    end
  end
end
