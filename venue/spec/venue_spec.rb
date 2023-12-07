require 'pry'
require 'rspec'
require './lib/venue'

describe Venue do
  describe '#initialize' do
    it 'is a venue' do
      venue = Venue.new('Bluebird', 4)
      expect(venue).to be_a Venue
    end

    it 'can read the name' do
      venue = Venue.new('Bluebird', 4)
      expect(venue.name).to eq 'Bluebird'
    end

    it 'can read the capacity' do
      venue = Venue.new('Bluebird', 4)
      expect(venue.capacity).to eq 4
    end

    it 'has no patrons by default' do
      venue = Venue.new('Bluebird', 4)
      expect(venue.patrons).to eq []
    end
  end

  # Iteration 2

  describe '#add_patron' do
    it 'returns a list of patrons' do

      venue = Venue.new('Bluebird', 4)
      venue.add_patron('Mike')
      venue.add_patron('Megan')
      venue.add_patron('Bob')

      expect(venue.patrons).to eq ['Mike', 'Megan', 'Bob']
    end
  end

  describe '#yell_at_patrons' do
    it 'returns a list of uppercased names' do

      venue = Venue.new('Bluebird', 4)
      venue.add_patron('Mike')
      venue.add_patron('Megan')
      venue.add_patron('Bob')
      expect(venue.yell_at_patrons).to eq ['MIKE', 'MEGAN', 'BOB']
    end
  end

  describe 'over_capacity' do
    it 'return true or false if the venue has more patrons
    than the capacity' do

      venue = Venue.new('Bluebird', 4)
      venue.add_patron('Mike')
      venue.add_patron('Megan')
      venue.add_patron('Bob')

      expect(venue.over_capacity?).to eq false

      venue.add_patron('Zah')
      venue.add_patron('Chris')
      venue.add_patron('Paris')
      venue.add_patron('Imani')

      expect(venue.over_capacity?).to eq true
    end
  end

  describe 'kick_out' do
    it 'continue to remove patrons from the venue until it is
    no longer over capacity' do

      venue = Venue.new('Bluebird', 4)
      venue.add_patron('Mike')
      venue.add_patron('Megan')
      venue.add_patron('Bob')

      expect(venue.over_capacity?).to eq false

      venue.add_patron('Zah')
      venue.add_patron('Chris')
      venue.add_patron('Paris')
      venue.add_patron('Imani')

      expect(venue.over_capacity?).to eq true

      venue.kick_out
      venue.kick_out
      venue.kick_out
      venue.kick_out

      expect(venue.over_capacity?).to eq false
    end
  end
end
