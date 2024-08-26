class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :jwt_authenticatable,
         :recoverable, :rememberable, :validatable, jwt_revocation_strategy: JwtDenylist

  # validates :email, presence: true, uniqueness: true
  # validates :password, presence: true, length: { minimum: 6 }
  # validates :first_name, presence: true
  # validates :last_name, presence: true

  has_many :seances
  has_many :seance_templates
  # def initialize(params)
  # super(params)
  # end

end
