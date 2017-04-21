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
