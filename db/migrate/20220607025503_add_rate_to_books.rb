class AddRateToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :rate, :float, null: false, default: 0
  end
end
