class AddRoleToUser < ActiveRecord::Migration
  def up
    add_column :users, :role, :string

    User.create(name: 'admin', 
                password: 'Qwpopo00', 
                password_confirmation: 'Qwpopo00', 
                role: 'pm')
  end

  def down
    remove_column :users, :role
  end
end
