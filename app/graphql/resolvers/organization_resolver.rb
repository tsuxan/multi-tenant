module Resolvers
    class OrganizationResolver < BaseResolver
        type Types::OrganizationType, null: false
        argument :id, ID

        def resolve(id:)
            ::Organization.find(id)
        end
    end
end