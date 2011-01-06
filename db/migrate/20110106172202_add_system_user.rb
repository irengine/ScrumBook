class AddSystemUser < ActiveRecord::Migration
  def self.up
    User.create(:name => 'sysAdmin',
      :full_name => 'System Administrator',
      :email => 'sysAdmin@taoware.com',
      :password=> 'P@ssword'
    )
  end

  def self.down
    User.delete_all
  end
end
