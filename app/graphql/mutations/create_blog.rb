# frozen_string_literal: true
module Mutations
  class CreateBlog < Mutations::BaseMutation
    null true
    argument :title, String, required: true
    argument :body, String, required:true
    argument :user_id, ID, required:true
    argument :organization_id, ID, required:true

    field :blog, Types::BlogType
    field :error, [String], null: false
    # field :message, [String], null: true
    
    def resolve(title:, body:, user_id:, organization_id:)
      user = User.find(user_id)
      blog = user.blogs.create(title: title, body: body, organization_id: organization_id,user_id: user_id)
      if blog.valid?
      {
        blog: blog, 
        error:[], 
        message: ["Succesfully created a blog"] 
      }
      else
      { 
        blog: nil, 
        error: ["Failed to create a blog"], 
        message: [] 
      }
      end
    end

    # TODO: define return fields
    # field :post, Types::PostType, null: false

    # TODO: define arguments
    # argument :name, String, required: true

    # TODO: define resolve method
    # def resolve(name:)
    #   { post: ... }
    # end
  end
end
