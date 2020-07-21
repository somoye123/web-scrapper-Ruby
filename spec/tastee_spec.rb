require './lib/tastee'

describe Tastee do
  let(:tastee) { Tastee.new }
  describe '#initialize' do
    it 'initialize url to string value' do
      expect(tastee.url).to be_a(String)
    end
    it 'initialize tastee_location to an empty array' do
      expect(tastee.tastee_locations).to eql([])
    end
    it 'initialize parsed_page to null' do
      expect(tastee.parsed_page.nil?).to eql(true)
    end
  end
  describe '#scrape' do
    let(:csv) { CSV.open('csv_output/tastee1.csv', 'a+') }
    let(:update_csv) { csv << %w[area address delivery] }

    it 'should update the location array' do
      tastee.scrape(update_csv)
      expect(tastee.tastee_locations.length).to be > 0
    end
    it 'should assign a value to parse_page' do
      tastee.scrape(update_csv)
      expect(tastee.parsed_page.nil?).to eql(false)
    end
  end
end
