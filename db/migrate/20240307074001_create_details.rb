class CreateDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :details do |t|
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
