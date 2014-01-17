class CreateAmazonitems < ActiveRecord::Migration
  def change
    create_table :amazonitems do |t|
      t.column :asin, :string, :null => false
      t.column :detailpageurl, :text
      t.column :isbn, :string
      t.column :title, :string
      t.column :author, :string
      t.column :manufacturer, :string
      t.column :product_group, :string
      t.column :publication_date, :string
      t.column :s_image_url, :text
      t.column :m_image_url, :text
      t.column :l_image_url, :text
      t.timestamps
    end
  end
end
