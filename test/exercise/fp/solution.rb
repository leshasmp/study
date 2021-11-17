module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        filtered = array.filter{ |film| !film['country'].nil? } \
        .filter{ |film| film['country'].split(',').count >= 2 } \
        .filter{ |film| !film['rating_kinopoisk'].to_i.zero? }
        raitings = filtered.map{ |film| film['rating_kinopoisk'].to_f }
        raitings.reduce(:+) / raitings.count
      end

      def chars_count(films, threshold)
        search_symbol = 'и'
        films.filter{ |film| !film['rating_kinopoisk'].to_i.zero? } \
        .filter{ |film| film['rating_kinopoisk'].to_f >= threshold } \
        .filter{ |film| !film['name'].index(search_symbol).nil? } \
        .map { |film| film['name'].count(search_symbol) }.reduce(:+)
      end
    end
  end
end
