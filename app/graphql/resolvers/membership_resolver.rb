module Resolvers
    class MembershipResolver < BaseResolver
        type Types::MembershipType, null:false
        argument :id, ID

        def resolve(id:)
            ::Membership.find(id)
        end
    end

end