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
