class Like < ApplicationRecord

    belongs_to(
        :user,
        class_name: 'User',
        foreign_key: :user_id,
        primary_key: :id
    )

    belongs_to :likeable, polymorphic: true
    
end