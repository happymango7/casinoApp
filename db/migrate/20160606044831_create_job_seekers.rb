class CreateJobSeekers < ActiveRecord::Migration
  def change
    create_table :job_seekers do |t|
      t.string :first_name
      t.string :middle_initial
      t.string :last_name
      t.string :suffix
      t.string :residency
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :primary_phone
      t.string :secondary_phone
      t.string :username
      t.string :hear_about_us
      t.boolean :confirm_tos_pp
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
