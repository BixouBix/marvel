# frozen_string_literal: true

require 'digest'
require 'json'
require 'time'
require 'pry'

module Marvel
  PUBLIC_KEY = '4df716d6bb9007881f16c148e4e06be8'.freeze
  PRIVATE_KEY = 'd61db5b006beab45ce2f084f9dda9807e2bc311e'.freeze
  BASE_PATH = 'http://gateway.marvel.com/'

  # Auth config to hit the API with authenticated requests
  class Client
    class << self
      def auth_hash(timestamp)
        Digest::MD5.hexdigest(timestamp + PRIVATE_KEY + PUBLIC_KEY)
      end

      def auth_params
        timestamp = Time.now.iso8601
        hash = auth_hash(timestamp)

        {
          ts: timestamp,
          apikey: PUBLIC_KEY,
          hash: hash
        }
      end
    end
  end
end
