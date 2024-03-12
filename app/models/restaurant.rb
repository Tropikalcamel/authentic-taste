class Restaurant < ApplicationRecord
  has_many :reviews
  has_many :boomarks

  # include PgSearch::Model
  # pg_search_scope :search_by_cuisine_and_neighborhood_and_dietary_requirements ,
  #   against: [ :neighborhood, :cuisine, :dietary_requirements],
  #   using: {
  #     tsearch: { prefix: true }
  #   }

    include PgSearch::Model

    # Assuming you have columns cuisine, neighborhood, dietary_requirements, and authentic (boolean) in your model

    pg_search_scope :search,
                    against: [:cuisine, :neighborhood, :dietary_requirements],
                    using: {
                      tsearch: { prefix: true }
                    }

    def self.search_with_priority(query)
      # Use ts_rank to prioritize certain conditions (e.g., authentic badge)
      order_expression = <<-SQL
        ts_rank(
          to_tsvector('english', coalesce(cuisine, '')) ||
          to_tsvector('english', coalesce(neighborhood, '')) ||
          to_tsvector('english', coalesce(dietary_requirements, '')),
          plainto_tsquery('english', :query)
        ) DESC,
        authentic DESC
      SQL

      # Perform the search and prioritize the results
      search(query).order(Arel.sql(order_expression))
    end

    def calculate_average
      review_sum = 0
      self.reviews.each do |review|
        review_sum += review.rating
      end
      review_sum/ reviews.length
    end

  end
