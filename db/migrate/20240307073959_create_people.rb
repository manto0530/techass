class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :name
      t.text :info
      t.string :title
      t.integer :age
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
