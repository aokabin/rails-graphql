module Types
  class MutationType < Types::BaseObject
    field :comment_create, mutation: Mutations::CommentCreate
    field :update_post, mutation: Mutations::UpdatePost
    field :create_post, mutation: Mutations::CreatePost
  end
end
