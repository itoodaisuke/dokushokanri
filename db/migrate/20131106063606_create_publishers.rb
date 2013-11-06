class CreatePublishers < ActiveRecord::Migration
  def change
    create_table :publishers do |t|
      t.references :book, index: true
      t.string :name

      t.timestamps
    end
  end
end
