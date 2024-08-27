# frozen_string_literal: true

module Mutations
  class CreateProfile < BaseMutation
    # This can also be used for updating existing profile as well as creating a new one .....
    argument :user_id, ID, required: true
    argument :full_name, String, required: true
    argument :gender, String, required: true
    argument :address, String, required: true
    argument :contact_no, Integer, required: true
    argument :bio, String, required: true

    field :profile, Types::ProfileType, null: true
    field :error, [String], null: false
    field :message, String, null: true

    def resolve(user_id:, full_name:, gender:, address:, contact_no:, bio:)
      user = User.find_by(id: user_id)
      if user.present?
        profile = Profile.find_by(user_id: user.id)
        if profile.nil?
          Profile.create(full_name: full_name, gender: gender, address: address, contact_no: contact_no, bio: bio)
        else
        profile.update(full_name: full_name, gender: gender, address: address, contact_no: contact_no, bio: bio)
        if profile.save
          {
            profile: profile,
            error: [],
            message: "The Profile has been updated successfully"
          }   
        else
          {
            profile: nil,
            error: ["The profile cannot be updated"]
          }
        end
      end
      else
        {
        profile: nil,
        error: ["The user_id is not valid"],
        message: nil}
      end
    end

  end
end
