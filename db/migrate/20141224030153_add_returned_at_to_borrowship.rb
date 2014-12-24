class AddReturnedAtToBorrowship < ActiveRecord::Migration
  def change
    add_column :borrowships, :returned_at, :datetime
  end
end
