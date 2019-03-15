class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.string :title
      t.string :description
      t.string :body

      t.timestamps
    end
  end
end
