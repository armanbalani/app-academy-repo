require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    CATS = ["white", "black", "orange", "brown", "grey", "Calico"]
    
    validates :name, presence: true
    validates :color, presence: true
    validates :sex, presence: true
    validates :birth_date, presence: true
    validates :description, presence: true

    validates :color, inclusion: { in: CATS, message: "not a valid color" }
    validates :sex, inclusion: { in: %w(M F), message: "not a valid sex" }


    def age
        time_ago_in_words(self.birth_date) + " old"
    end
end