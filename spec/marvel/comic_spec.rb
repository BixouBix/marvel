require_relative '../../marvel'

describe Marvel::Comic do
  describe 'query /comics' do
    context 'by id' do
      let (:id) { 41354 }

      subject {described_class.by_id(id)}

      its(:id) { is_expected.to eq id }
      its(:title) {is_expected.to eq 'Avengers Assemble (2012) #3'}
      its(:description) {is_expected.to match /The Avengers square off against the Zodiac/}
    end

    context 'by title' do
      let (:title) {'Avengers'}

      subject {described_class.by_title(title)[0]}

      its(:title) {is_expected.to eq 'Avengers (2018) #19'}
    end

    context 'by titleStartsWith' do
      let (:title) {'Avengers'}

      subject {described_class.by_titleStartsWith(title)[0]}

      its(:title) {is_expected.to eq 'Avengers (2018) #19'}
    end

    context 'by characters' do
      let (:character) {1009610}

      subject {described_class.by_characters(character)[0]}
      its(:title) {is_expected.to eq "Marvel Age Spider-Man Vol. 2: Everyday Hero (Digest)"}
    end
  end
end
