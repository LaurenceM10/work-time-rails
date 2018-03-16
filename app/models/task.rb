class Task < ApplicationRecord
     belongs_to :team
     has_many :user_tasks
end
