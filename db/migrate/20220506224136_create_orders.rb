# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :school, null: false, foreign_key: true
      t.integer :workflow_status

      t.timestamps
    end
  end
end
