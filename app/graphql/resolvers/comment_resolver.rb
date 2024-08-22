module Resolvers
    class CommentResolver < BaseResolver
      type Types::CommentType, null: false
      argument :id, ID
  
      def resolve(id:)
        ::Comment.find(id)
      end
    end
  end