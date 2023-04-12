require 'rails_helper'

RSpec.describe SearchQuery, type: :model do
  subject { described_class.new(query: 'test query', count: 1) }

  describe 'validations' do
    it 'is not valid without a query' do
      subject.query = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a count' do
      subject.count = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with a non-unique query' do
      existing_query = SearchQuery.create(query: 'test query', count: 2)
      subject.query = existing_query.query
      expect(subject).to_not be_valid
    end
  end
end
