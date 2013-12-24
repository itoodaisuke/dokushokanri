class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :asin
      t.string :isbn
      t.string :s_image
      t.string :m_image
      t.string :l_image
    end
  end
end
