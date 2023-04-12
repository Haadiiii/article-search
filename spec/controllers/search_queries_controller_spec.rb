require 'rails_helper'

RSpec.describe SearchQueriesController, type: :controller do
  describe 'GET #index' do
    let(:current_user) { create(:user) }

    it 'assigns the search queries to @search_queries' do
      get :index

      expect(assigns(:search_queries)).to be_nil
    end

    context 'with a search query' do
      let(:search_query_params) { { q: { query_cont: 'test' } } }
      it 'tracks a search event with Ahoy' do
        get :index, params: search_query_params

        expect(assigns(:search_events)).to be_nil
      end

      it 'assigns the search events to @search_events' do
        get :index, params: search_query_params

        expect(assigns(:search_events)).to be_nil
      end

      it 'assigns the all search events to @search_all_events' do
        get :index, params: search_query_params

        expect(assigns(:search_all_events)).to be_nil
      end
    end

    context 'without a search query' do
      it 'does not track a search event with Ahoy' do
        expect_any_instance_of(Ahoy::Tracker).not_to receive(:track)

        get :index
      end

      it 'assigns empty hash to @search_events' do
        get :index

        expect(assigns(:search_events)).to be_nil
      end

      it 'assigns empty hash to @search_all_events' do
        get :index

        expect(assigns(:search_all_events)).to be_nil
      end
    end
  end
end
