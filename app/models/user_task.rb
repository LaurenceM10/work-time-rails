class UserTask < ApplicationRecord
     belongs_to :users
     belongs_to :tasks
end
