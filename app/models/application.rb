class Application < ActiveRecord::Base
  # validates :first_name, :last_name, :email, presence: true
 
  belongs_to :job
  belongs_to :user

end
