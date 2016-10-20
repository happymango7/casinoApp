class Job < ActiveRecord::Base
  validates :company, :title, :city, :state, presence: true

  has_many :applications
  has_many :users, through: :applications
  # has_many :applicants, through: :applications, class_name: "User", foreign_key: :user_id
  
end
