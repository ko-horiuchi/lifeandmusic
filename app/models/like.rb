class Like < ApplicationRecord
 belongs_to :music, optional: true
 belongs_to :user, optional: true
 
 validates_uniqueness_of :music_id, scope: :user_id
end
