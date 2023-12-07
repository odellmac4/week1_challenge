class Venue

    attr_reader :name, :capacity, :patrons

    def initialize(name , capacity)
        @name = name
        @capacity = capacity
        @patrons = []
    end

    def add_patron(name)
        patrons << name
    end

    def yell_at_patrons
        patrons.map {|patron| patron.upcase}
    end

    def over_capacity?
        patrons.length  > capacity
    end

    def kick_out
        patrons.slice!(patrons.length - 1)
        # patrons.delete_at(patrons.length - 1)
    end
    
end