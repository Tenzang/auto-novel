class Novel < ApplicationRecord
    has_and_belongs_to_many :excerpts
    belongs_to :user
end
