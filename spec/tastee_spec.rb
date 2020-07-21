require './lib/tastee'

describe Tastee do
    let(:tastee) {Tastee.new}
    describe "#initialize" do
        it 'initialize all instance variables' do
            expect(tastee.url).to be_a(String)
            expect(tastee.tastee_locations).to eql([])
        end
    end
    describe '#scrape' do
        it 'should update the location array' do
          tastee.scrape
          expect(tastee.tastee_locations.length).to be > 0
        end
    end
end