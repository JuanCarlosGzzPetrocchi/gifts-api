class CreateOrderRecipients < ActiveRecord::Migration[6.1]
  def change
    create_table :order_recipients do |t|
      t.references :order, null: false, foreign_key: true
      t.references :recipient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
