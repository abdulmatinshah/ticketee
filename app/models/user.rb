class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tickets

  validates :password, presence: true,
                       confirmation: true
  validates_confirmation_of :password
  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end
end
