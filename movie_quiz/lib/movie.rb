class Movie
  attr_reader :title, :poster, :year
  def initialize(title, poster, year)
    @title = title
    @poster = poster
    @year = year
  end
end
