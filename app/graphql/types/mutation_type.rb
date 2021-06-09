module Types
  class MutationType < Types::BaseObject
    field :update_post, mutation: Mutations::UpdatePost
    field :create_post, mutation: Mutations::CreatePost
  end
end
