class CreateBookLoans < ActiveRecord::Migration[7.0]
  def change
    create_table :book_loans do |t|
      t.string :status, default: 'checked_out'
      t.date :due_date
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
