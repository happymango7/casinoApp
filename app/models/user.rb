class User < ActiveRecord::Base
  enum role: [:admin, :employer, :job_seeker]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :applications
  has_many :jobs, through: :applications

  has_one :job_seeker, dependent: :destroy
  accepts_nested_attributes_for :job_seeker, :allow_destroy => true

  
end
