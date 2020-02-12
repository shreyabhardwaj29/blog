class DropTableUser < ActiveRecord::Migration[5.2]
  def self.up
    drop_table :users
  end

end
