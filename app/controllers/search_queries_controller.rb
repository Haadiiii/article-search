class SearchQueriesController < ApplicationController
  def index
    @q = SearchQuery.ransack(params[:q])
    @search_queries = @q.result(distinct: true)

    ahoy.track 'Search', query: params[:q][:query_cont], results: @search_queries.count if params[:q].present?

    @search_events = Ahoy::Event.where(name: 'Search', user_id: current_user.id).group(:properties).count
    @search_all_events = Ahoy::Event.where(name: 'Search').group(:properties).count
  end
end
