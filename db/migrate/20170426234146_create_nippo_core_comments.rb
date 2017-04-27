class CreateNippoCoreComments < ActiveRecord::Migration[5.0]
  def change
    create_table :nippo_core_comments do |t|
      t.integer :user_id, null: false, index: true
      t.foreign_key :nippo_core_users, column: :user_id
      t.integer :report_id, null: false, index: true
      t.foreign_key :nippo_core_reports, column: :report_id
      t.text :body, null: false

      t.timestamps
    end
  end
end
