class ArtworkShare < ApplicationRecord
    validates :artwork_id, presence: true, uniqueness: { scope: :viewer_id } 
    validates :viewer_id, presence: true

    belongs_to(
        :viewer,
        class_name: 'User',
        foreign_key: :viewer_id,
        primary_key: :id
    )

    belongs_to(
        :artwork,
        class_name: 'Artwork',
        foreign_key: :artwork_id,
        primary_key: :id
    )
end