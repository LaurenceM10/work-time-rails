class Team < ApplicationRecord
     has_many :user_teams
     has_many :user, through: :user_teams
end
