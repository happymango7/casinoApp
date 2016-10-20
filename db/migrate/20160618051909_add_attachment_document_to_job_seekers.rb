class AddAttachmentDocumentToJobSeekers < ActiveRecord::Migration
  def self.up
    change_table :job_seekers do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :job_seekers, :document
  end
end
