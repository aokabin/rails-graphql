module Mutations
  class CommentCreate < BaseMutation
    graphql_name 'CommentCreate'

    field :comment, Types::CommentType, null: true
    field :result, Boolean, null: true

    argument :post_id, ID, required: true
    argument :content, String, required: false

    def resolve(**args)
      comment = Comment.create(post_id: args[:post_id], content: args[:content])
      {
        comment: comment,
        result: comment.errors.blank?
      }
    end
  end
end
