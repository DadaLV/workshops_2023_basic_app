class CreateBookReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :book_reservations do |t|
      t.string :status, default: 'initialized'
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
