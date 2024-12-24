class CreateLists < ActiveRecord::Migration[7.0]
  def change
    create_table :lists do |t|
      t.name :string
      

      t.timestamps
    end
  end
end
