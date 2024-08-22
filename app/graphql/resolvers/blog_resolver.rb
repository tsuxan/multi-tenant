module Resolvers
    class BlogResolver < BaseResolver
      type Types::BlogType, null: false
      argument :id, ID
  
      def resolve(id:)
        ::Blog.find(id)
      end
    end
  end