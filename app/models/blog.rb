class Blog < ApplicationRecord
    belongs_to :user
    belongs_to :organization
    has_many :comments

    validates :title , presence: true
    validates :body,  presence: true
end
