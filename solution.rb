class Viewer
  attr_accessor :first_name, :last_name
  attr_reader :name
  ALL = []

  def self.all
    ALL
  end

  def initialize(name)
    @name = name
    ALL << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.find_by_name(name)
    self.all.find {|viewer| viewer.name == name}
  end

  def create_rating(movie, score)
    movie = Movie.find_by_title(movie) if movie.class == String
    Rating.new(self, movie, score)
  end

end

class Movie
  attr_accessor :title

  ALL = []

  def initialize(title)
    self.title = title
    ALL << self
  end

  def self.all
    ALL
  end

  def self.find_by_title(title)
    self.all.find {|movie| movie.title == title}
  end

  def ratings
    Rating.all.select {|rating| rating.movie == self}
  end

  def viewers
    self.ratings.collect {|rating| rating.viewer}
  end

  def average_rating
    scores = self.ratings.collect{|r| r.score}
    sum = scores.inject {|score,sum| score + sum}
    count = self.ratings.length
    (sum.to_f / count).round(2) # to make cleaner
  end

end

class Rating
  attr_accessor :score
  attr_reader :viewer, :movie

  ALL = []

  def initialize(viewer, movie, score)
      @viewer = viewer
      @movie = movie
      @score = score
      ALL << self
  end

  def self.all
    ALL
  end

end
