class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.boolean :available, :default => true
      t.timestamps
    end
  end
end
