require 'pry'
class Movie < ActiveRecord::Base
    def self.create_with_title(title)
        new_movie = Movie.new(title: title)
        new_movie.save
        new_movie
    end

    def self.first_movie
        Movie.first
    end

    def self.last_movie
        Movie.last
    end

    def self.movie_count
        Movie.count
    end

    def self.find_movie_with_id(id)
        Movie.find{|e| e.id == id}
    end
    
    def self.find_movie_with_attributes(options)
        results = []
        options.each do |key, value|
            results << Movie.find_by(key => value)
        end
        results[0]
    end

    def self.find_movies_after_2002
        Movie.where("(release_date) > 2002")
    end

    def update_with_attributes(options)
        res = options.each do |key, value|
            self.update(key=>value)
        end
        res
    end

    def self.update_all_titles(title)
        Movie.update(title: title) 
    end

    def self.delete_by_id(id)
        Movie.where(id: id).destroy(1)
    end

    def self.delete_all_movies
        Movie.destroy_all
    end

end