require 'rails_helper'

RSpec.describe Category do
  describe 'validations' do
    subject(:category) { described_class.new(name:) }

    context 'when name indicated' do
      let(:name) { 'Thriller' }

      specify { expect(category).to be_valid }
    end

    context 'when name is empty' do
      let(:name) { nil }

      specify { expect(category).to be_invalid }
    end
  end

  describe 'associations' do
    specify { is_expected.to have_many(:books) }
  end
end
