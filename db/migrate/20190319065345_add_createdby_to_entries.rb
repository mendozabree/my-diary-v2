class AddCreatedbyToEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :created_by, :string
  end
end
