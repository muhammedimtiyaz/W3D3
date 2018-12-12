require 'SecureRandom'

class ShortenedUrl < ApplicationRecord
    include SecureRandom

    validates :long_url, presence: true, uniqueness: true

    belongs_to :user,
        class_name: 'User',
        primary_key: :id,
        foreign_key: :user_id


    def self.random_code
        while true
            random_code = SecureRandom.urlsafe_base64(16)
            return random_code unless ShortenedUrl.exists?(short_url: random_code)
        end
    end

    def self.create_short_url
        ShortenedUrl.create!(User.new(:email), :long_url)
    end
end