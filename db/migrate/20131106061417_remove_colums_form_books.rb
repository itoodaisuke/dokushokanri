class RemoveColumsFormBooks < ActiveRecord::Migration
  def change
    remove_column :books, :publisher, :string
    remove_column :books, :author, :string
    remove_column :books, :start, :date
    remove_column :books, :end, :date
    remove_column :books, :summary, :text

  end
end
