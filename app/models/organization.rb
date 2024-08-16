class Organization < ApplicationRecord
    has_many :blogs
    has_many :membership
    has_many :users ,through: :membership
end
