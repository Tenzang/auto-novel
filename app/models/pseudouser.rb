class Pseudouser < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :novels
end
