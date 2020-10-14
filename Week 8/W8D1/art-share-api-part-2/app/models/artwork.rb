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

  has_many(
      :artwork_shares,
      class_name: 'ArtworkShare',
      foreign_key: :artwork_id,
      primary_key: :id
  )

  has_many(
      :comments,
      class_name: 'Comment',
      foreign_key: :artwork_id,
      primary_key: :id,
      dependent: :destroy
  )

  has_many :shared_viewers, through: :artwork_shares, source: :viewer

  has_many :likes, as: :likeable

  has_many :liked_users, through: :likes, source: :user


end