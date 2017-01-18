class QueryToIMDB
  attr_reader :movies
  def initialize(options=9)
    @movies = []
    @options = options
  end

  def do_query_to_IMDB(key_request)

    query = Imdb::Search.new(key_request).movies[1..25]
    i = 0
    while @movies.length < 9 && i < 25
      @movies.push(Movie.new(query[i].title, query[i].poster, query[i].year)) if query[i].poster
        i += 1
    end
  end

  def verify_poster_in_movies
    @movies.select { |movie| movie.poster }
  end
end
