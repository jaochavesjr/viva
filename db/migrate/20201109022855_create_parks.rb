class CreateParks < ActiveRecord::Migration[6.0]
  def change
    create_table :parks do |t|
      t.string :name
      t.text :description
      t.string :contact_one
      t.string :contact_two
      t.string :email
      t.integer :status
      t.references :state, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
