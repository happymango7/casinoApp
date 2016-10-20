class AddPrefixToJobSeekers < ActiveRecord::Migration
  def change
    add_column :job_seekers, :prefix, :string
  end
end
