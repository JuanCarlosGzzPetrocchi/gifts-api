class FixGiftTypeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :gifts, :type, :gift_type
  end
end
