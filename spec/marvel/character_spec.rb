require_relative '../../marvel'

describe Marvel::Character do
  describe 'query /characters' do
    context 'by name' do
      let(:name) { 'Spider-Man' }

      subject { described_class.by_name(name) }

      its(:id) { is_expected.to eq 1009610 }
      its(:name) { is_expected.to eq name }
      its(:description) { is_expected.to match /Bitten by a radioactive spider/ }
    end
    context 'by name starts with' do
      let(:name) { 'tha' }

      subject {described_class.by_nameStartsWith(name)[0]}

      its(:name) {is_expected.to match /^Tha/}
    end
    context 'by one event' do
      let(:id) { 229 }

      subject {described_class.by_events(id)[0]}

      its(:id) {is_expected.to eql 1011136}
    end
    context 'by more events' do
      let(:ids) {'200, 235'}

      subject {described_class.by_events(ids)[0]}

      its(:id) {is_expected.to be 1010354}
    end
  end
end
