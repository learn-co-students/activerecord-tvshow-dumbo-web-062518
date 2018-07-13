class Show < ActiveRecord::Base
  def self.highest_rating
    Show.maximum(:rating)
  end

  def self.most_popular_show
    Show.order(:rating).last
  end

  def self.lowest_rating
    Show.minimum(:rating)
  end

  def self.least_popular_show
    Show.order(:rating).first
  end

  def self.ratings_sum
    sum = 0
    Show.all.each {|show| sum += show.rating}
    sum
  end

  def self.popular_shows
    Show.all.select{|show| show.rating > 5}

  end

  def self.shows_by_alphabetical_order
    Show.order(:name)
  end

end
