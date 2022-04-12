class Excerpt < ApplicationRecord
    belongs_to :user, :optional => true
end
