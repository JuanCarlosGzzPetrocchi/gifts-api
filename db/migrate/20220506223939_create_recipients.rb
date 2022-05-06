class CreateRecipients < ActiveRecord::Migration[6.1]
  def change
    create_table :recipients do |t|
      t.string :name
      t.string :address
      t.references :school, null: false, foreign_key: true

      t.timestamps
    end
  end
end
