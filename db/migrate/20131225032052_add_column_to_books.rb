class AddColumnToBooks < ActiveRecord::Migration
  def change
    add_column :books, :publication_date, :date
    add_column :books, :product_group, :string
  end
end
