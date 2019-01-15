class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

    validate :clickbait_y
    def clickbait_y
        if self.title.present? && self.title.exclude?("Won't Believe"||"Secret"||"Guess")
             errors.add(:non_clickbait, "Title not click_baity")
        end
    end
end


# "Won't Believe", "Secret", "Top [number]", or "Guess", 