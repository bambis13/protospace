class Comment < ActiveRecord::Base
  belongs_to :user, :prototype
end
