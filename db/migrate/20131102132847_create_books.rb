class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :publisher
      t.string :author
      t.integer :isbn
      t.date :start
      t.date :end
      t.text :summary
    end
  end
end
