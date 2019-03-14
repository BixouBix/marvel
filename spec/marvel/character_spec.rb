require_relative '../../marvel'

describe Marvel::Character do
  describe 'query /characters' do
    context 'with a single result' do
      let(:name) { 'Spider-Man' }

      subject { described_class.by_name(name) }

      its(:id) { is_expected.to eq 1009610 }
      its(:name) { is_expected.to eq name }
      its(:description) { is_expected.to match /Bitten by a radioactive spider/ }
    end
    context 'with multiple results' do
      let(:param) { 'tha' }

      subject {described_class.by_nameStartsWith(param)}

      its(:count) { is_expected.to eq 3 }
    end
  end
end
