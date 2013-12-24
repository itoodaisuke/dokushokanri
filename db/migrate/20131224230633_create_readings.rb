class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.references :book, index: true
      t.date :started_on
      t.date :finished_on
      t.text :comment

      t.timestamps
    end
  end
end
