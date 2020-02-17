class RenameRolesIdToRoleId < ActiveRecord::Migration[5.2]
  def change
    rename_column :permissions, :role_id, :role_id
  end
end
