class Novel < ApplicationRecord
    has_and_belongs_to_many :excerpts
    belongs_to :user
    has_and_belongs_to_many :pseudousers
end
