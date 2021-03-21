class Artist < ApplicationRecord

  enum genre: { Pop: 0, Rock: 1, RandB: 2, Jazz: 3, Classic: 4, Others: 5 }
  belongs_to :user
  has_many :musics
end
