class Music < ApplicationRecord
  enum scene: { Mornig: 0, Night: 1, Holiday: 2, Drive: 3, Happy: 4, Sad: 5 }
  belongs_to :artist
  belongs_to :user
end
