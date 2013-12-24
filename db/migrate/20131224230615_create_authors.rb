class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.references :book, index: true
      t.string :name

      t.timestamps
    end
  end
end
