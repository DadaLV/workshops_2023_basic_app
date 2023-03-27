# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  describe '#validations' do
    let(:book) { build(:book) }

    context 'when factory is valid' do
      specify { expect(book).to be_valid }
    end

    context 'when model has invalid data' do
      let(:book) { build(:book, title: nil) }

      specify do
        expect(book).not_to be_valid
      end
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:category) }
    it { is_expected.to belong_to(:author) }
    it { is_expected.to belong_to(:publisher) }
  end
end
