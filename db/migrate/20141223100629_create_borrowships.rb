class CreateBorrowships < ActiveRecord::Migration
  def change
    create_table :borrowships do |t|
      t.integer :borrower_id
      t.integer :book_id
      t.boolean    :is_returned, :default => false
      t.timestamps
    end
  end
end
