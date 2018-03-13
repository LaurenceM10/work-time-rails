class Team < ApplicationRecord
     has_many :user_teams
     has_many :user, through: :user_teams

     validates :name, presence: true
     validates :objective, presence: true
     validates :description, presence: true
end
