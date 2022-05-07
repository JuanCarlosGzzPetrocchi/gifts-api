# frozen_string_literal: true

class CreateGifts < ActiveRecord::Migration[6.1]
  def change
    create_table :gifts do |t|
      t.integer :type

      t.timestamps
    end
  end
end
