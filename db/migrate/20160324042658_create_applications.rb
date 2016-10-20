class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :message
      t.string :attachment
      t.integer :job_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
