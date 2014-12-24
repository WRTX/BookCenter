class AddExtraInfoToBook < ActiveRecord::Migration
  def change
    add_column :books, :stars, :integer
    add_column :books, :suggested_by, :string
    add_column :books, :suggestion, :text
  end
end
