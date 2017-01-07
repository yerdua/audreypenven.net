class CreateCollaboratorRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :collaborator_roles do |t|
      t.integer :collaborator_id, null: false
      t.integer :photograph_id, null: false
      t.string  :title, null: false

      t.timestamps
    end

    add_index :collaborator_roles, :collaborator_id
    add_index :collaborator_roles, :photograph_id
    add_index :collaborator_roles, :title
  end
end
