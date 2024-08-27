# frozen_string_literal: true

module Mutations
  class CreateComment < Mutations::BaseMutation

    argument :commenter, String, required: true
    argument :body, String, required: true
    argument :blog_id, Integer, required: true
    argument :organization_id, ID, required: true
    argument :user_id, ID, required: true

    field :comment, Types::CommentType, null: true
    field :error,[String], null: false
    field :message, String, null: true

    def resolve(commenter:, body:, blog_id:, organization_id:, user_id:)
      organization = Membership.find_by(user_id: user_id , organization_id: organization_id)
      user= User.find(user_id)
      # organization = Membership.find_by(user_id: user_id, organization_id: organization_id)

      if organization.nil?
        { 
          comment: nil,
          error: ["The user does not belong to this organization" ],
          message: nil
        }
      else
        comment = user.comments.create(commenter: commenter, body: body, blog_id: blog_id, user_id: user_id)
        if comment.save
          { 
          comment: comment, 
          error:[], 
          message: "Comment is added on the blog"
         }
        else
          {
            comment: nil,
             error:["Failed to post the comment"], 
             message: nil
            }
        end
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

