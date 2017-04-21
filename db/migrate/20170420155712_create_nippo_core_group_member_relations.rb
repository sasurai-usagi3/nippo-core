class CreateNippoCoreGroupMemberRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :nippo_core_group_member_relations do |t|
      t.integer :member_id, null: false, index: true
      t.foreign_key :nippo_core_users, column: :member_id
      t.integer :group_id, null: false, index: true
      t.foreign_key :nippo_core_groups, column: :group_id
      t.integer :authentication, null: false, default: 0
      t.boolean :status, null: false, default: false

      t.timestamps
    end
  end
end
