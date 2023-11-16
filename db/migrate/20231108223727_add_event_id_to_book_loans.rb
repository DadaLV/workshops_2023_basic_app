class AddEventIdToBookLoans < ActiveRecord::Migration[7.0]
  def change
    add_column :book_loans, :event_id, :string
  end
end
