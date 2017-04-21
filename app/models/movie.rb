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
