# frozen_string_literal: true

module Mutations
    class EditBlog < BaseMutation
    #   argument :user_id, ID, required: true
    #   argument :organization_id, ID, required: true
      argument :blog_id, ID, required: true
      argument :title, String, required: true
      argument :body, String, required: true
        
      field :blog, Types::BlogType, null: true
      field :message, String, null: true
      field :error, [String], null: false
        
      def resolve(blog_id:,title:, body:)
        blog = Blog.find(blog_id)
        if blog.present?
          blog.update(title: title, body: body)
            if blog.save
              {
                blog: blog,
                message: "Blog Updated",
                error: []
              }
            else
              raise GraphQL::ExecutionError, "Blog doesnot exist"
              {
                message: "",
                error: []
              }
            end
        end
      end
  
    end
  end
  