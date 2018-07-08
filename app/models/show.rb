class Show < ActiveRecord::Base

  def self.highest_rating
    self.maximum(:rating)
  end

  def self.most_popular_show
    self.find_by(self.maximum(:rating))
  end

  def self.lowest_rating
    self.minimum(:rating)
  end

  def self.least_popular_show
    self.order(rating: :asc).limit(1).flatten[0]
  end

  def self.ratings_sum
    self.sum(:rating)
  end

  def self.popular_shows
    self.where("rating > ?", 5)
  end

  def self.shows_by_alphabetical_order
    self.order(:name)
  end
end
