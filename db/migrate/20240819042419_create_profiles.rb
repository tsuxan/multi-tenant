class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :full_name
      t.string :gender
      t.string :address
      t.integer :contact_no
      t.string :bio

      t.timestamps
    end
  end
end
