class CreateNippoCoreGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :nippo_core_groups do |t|
      t.string :name
      t.text :description
      t.integer :creator_id, null: false, index: true
      t.foreign_key :nippo_core_users, column: :creator_id

      t.timestamps
    end
  end
end
