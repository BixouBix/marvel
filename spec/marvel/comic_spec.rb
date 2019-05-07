require_relative '../../marvel'

describe Marvel::Comic do
  describe 'query /comics' do
    context 'by id' do
      let (:id) { 41354 }

      subject {described_class.by_id(id)}

      its(:id) { is_expected.to eq id }
      its(:title) {is_expected.to eq 'Avengers Assemble (2012) #3'}
    end
  end
end
