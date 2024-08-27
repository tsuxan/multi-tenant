# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :userlogin, mutation: Mutations::Userlogin
    field :create_profile, mutation: Mutations::CreateProfile
    field :create_user, mutation: Mutations::CreateUser
    field :create_blog, mutation: Mutations::CreateBlog
    field :create_comment, mutation: Mutations::CreateComment
    field :delete_blog, mutation: Mutations::DeleteBlog
    field :edit_blog, mutation: Mutations::EditBlog
  end
end
