class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :abstract
      t.text :content
      t.string :image_caption
      t.string :author

      t.timestamps
    end
  end
end
