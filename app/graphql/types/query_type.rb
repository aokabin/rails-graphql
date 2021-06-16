module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :posts, [Types::PostType], null: false
    def posts
      Post.all
    end

    field :post, Types::PostType, null: false do
      argument :id, Int, required: false
    end
    def post(id:)
      Post.find(id)
    end

    field :comments, [Types::CommentType], null: false do
      argument :post_id, Int, required: true
    end
    def comments(post_id:) # 投稿されたID
      Comment.where(post_id: post_id) # 投稿されたIDを用いて探す
    end
  end
end
