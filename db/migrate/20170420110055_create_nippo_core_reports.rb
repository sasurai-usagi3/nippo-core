class CreateNippoCoreReports < ActiveRecord::Migration[5.0]
  def change
    create_table :nippo_core_reports do |t|
      t.integer :user_id, null: false, index: true
      t.foreign_key :nippo_core_users, column: :user_id
      t.integer :group_id, null: false, index: true
      t.foreign_key :nippo_core_groups, column: :group_id
      t.date :reported_at, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
