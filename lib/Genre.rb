class Genre
    extend Concerns::Findable

    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name 
        @songs = []
        self.save
    end

    def save
        @@all << self
    end

    def self.all
        @@all.uniq
    end

    def self.destroy_all
        @@all.clear
    end

    def self.create(name)
        genre = self.new(name)
        genre.save
        genre
    end

    def songs
        @songs
    end

    def artists
        Artist.all
    end
end
