class User < ApplicationRecord
    validates :email, :presence => true, :uniqueness => true
    has_secure_password
    has_many :excerpts
    has_many :novels
    has_one :pseudouser
end