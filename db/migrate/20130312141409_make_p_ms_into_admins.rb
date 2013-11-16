class MakePMsIntoAdmins < ActiveRecord::Migration
  def up
    User.where('role = ?', 'pm').update_all(:role => 'admin')
  end

  def down
    User.where('role = ?', 'admin').update_all(:role => 'pm')
  end
end
