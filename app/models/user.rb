class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # To specify the many to many relations with the team model using UserTeam model
  has_many :user_teams
  has_many :teams, through: :user_teams


  validates :email, presence: true
  validates :encrypted_password, presence: true
end
