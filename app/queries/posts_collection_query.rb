# frozen_string_literal: true

class PostsCollectionQuery < BaseQuery
  def by_category_id
    @scope = scope.joins(:category).where(categories: { id: params[:category_id] })
  end

  def by_q
    @scope = scope.where(Post.arel_table[:title].matches("%#{params[:q]}%"))
  end

  def by_type
    case params[:type].to_s
    when 'recent'
      recent_posts
    when 'featured'
      featured_posts
    when 'most_read'
      most_read_posts
    else
      raise NotImplementedError
    end
  end

  private

  def recent_posts
    @scope = scope.latest
  end

  def featured_posts
    @scope = scope.featured.latest
  end

  def most_read_posts
    @scope = scope.most_read
  end
end
