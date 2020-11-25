class Artist
    extend Concerns::Findable

    attr_accessor :name
    attr_reader :songs

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
        artist = self.new(name)
        artist.save
        artist
    end

    def add_song(song)
        song.artist = self unless song.artist
      songs << song unless songs.include?(song)
    end

    def self.songs
        @songs
    end

    def genres
        Genre.all
    end
end
