# frozen_string_literal: true

module Mutations
  class CreateUser < BaseMutation

    argument :email, String, required: true
    argument :password, String, required: true
    argument :password_confirmation, String, required: true
    argument :organization_id, ID, required: true

    field :user, Types::UserType, null: false
    field :error, [String], null: false
    field :message, String, null: false

    def resolve(email:, password:, password_confirmation:, organization_id:)
      # membership = Membership.find_by(organization_id: organization_id)
      organization = Organization.find(organization_id)
      user = organization.users.new(email: email, password: password, password_confirmation: password_confirmation)
      if user.save
        membership = Membership.create(user_id: user.id, organization_id: organization_id)
        if membership.present?
          {
            user: user,
            error: [],
            message: "User has been sucessfully created.."
          }
        else
          # raise GraphQL::ExecutionError, "No membership created"
          {
            user: nil,
            error: ["Failed to create membership"],
            message: "Failed to create the user"
          }
        end        
      else
        # raise GraphQL::ExecutionError, "Failed to create the USER!.Try with different email and password"
        {
          user: nil,
          error: ["Failed to create the user"],
          message: nil
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
