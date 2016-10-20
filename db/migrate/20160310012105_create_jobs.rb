class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :company
      t.string :title
      t.text :description
      t.string :city
      t.string :state
      t.string :link

      t.timestamps null: false
    end
  end
end
