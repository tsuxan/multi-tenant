# frozen_string_literal: true
module Mutations
    class DeleteBlog < Mutations::BaseMutation
      null true
      argument :blog_id, ID, required: true
    #   argument :organization_id, ID, required:true
  
      field :blog, Types::BlogType, null: true
      field :error, [String], null: false
      field :message, String, null: true
      
      def resolve(blog_id:)
        blog_id = Blog.find(blog_id)
        if blog_id.present?
            Blog.destroy(blog_id.id)
            {
            blog: nil,
            error:[], 
            message: ["Succesfully deleted the blog"] 
            }
        else
            { 
            blog: nil, 
            error: ["Blog doesnot exists"], 
            message: ["Failed to delete blog"] 
            }
        end
      end
    end
  end
  