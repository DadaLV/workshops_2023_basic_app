class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :isbn
      t.integer :year
      t.integer :page_count
      t.date :published_on
      t.string :language
      t.references :author, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :publisher, foreign_key: true

      t.timestamps
    end
  end
end
