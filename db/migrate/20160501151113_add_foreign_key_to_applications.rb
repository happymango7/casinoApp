class AddForeignKeyToApplications < ActiveRecord::Migration
  def change
    add_foreign_key :applications, :users
  end
end
