class Artwork < ApplicationRecord
  validates :image_url, presence: true
  validates :artist_id, presence: true
  validates :title, presence: true, uniqueness: { scope: :artist_id }

  belongs_to( 
      :artist,
      class_name: 'User',
      foreign_key: :artist_id,
      primary_key: :id
  )

end