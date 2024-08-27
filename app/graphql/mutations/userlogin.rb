# frozen_string_literal: true

module Mutations
    class Userlogin < BaseMutation
      argument :email, String, required: true
      argument :password, String, required: true
      argument :organization_id, ID, required:true
  
      field :userlogin, Types::UserType, null: true
      field :message, String, null: true
      field :error, [String], null: false
        
      def resolve(email:, password:, organization_id:)
        organization = Organization.find(organization_id)

        # debugger
        if organization.present?
          user = organization.users.find_by(email: email)
          if user.present?
            if user.valid_password?(password)
              {
                message: "Login Sucessfull",
                error: []
              }
            else
              # raise GraphQL::ExecutionError, "Incorrect Password"
              {
                userlogin: nil,
                message: "Incorrect Password",
                error: []
              }
            end
          else
            # raise GraphQL::ExecutionError, "User is not present in this organozation"
            {
              userlogin: nil,
              message: "User is not present in this organization",
              error: []
            }
          end
        else
          {
            userlogin: nil,
            message: "Invalid Organization",
            error: []
          }
        end
      end
  
    end
  end
  