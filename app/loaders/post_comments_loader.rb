class PostCommentsLoader < GraphQL::Batch::Loader
  def perform(post_ids)
    Comment.where(post_id: post_ids).group_by(&:post_id).each do |post_id, comments|
      fulfill(post_id, comments)
    end
  end
end