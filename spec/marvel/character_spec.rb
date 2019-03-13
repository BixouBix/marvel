# frozen_string_literal: true

require_relative '../../marvel'

# Add the name of your character class here
describe YourCharacterClassHere do
  describe 'query /characters' do
    context 'with a single result' do
      let(:name) { 'Spider-Man' }

      # Call your Character API here, query for &name=#{name}
      subject { described_class.name_query_method(name) }

      its(:id) { is_expected.to eq 1009610 }
      its(:name) { is_expected.to eq name }
      its(:description) { is_expected.to match /Bitten by a radioactive spider/ }
    end
  end
end
