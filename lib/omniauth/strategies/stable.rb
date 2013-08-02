require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Stable < OmniAuth::Strategies::OAuth2
      API_ENDPOINT = "https://stable.bignerdranch.com"
      option :name, "stable"

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {
        site:           "https://stable.bignerdranch.com",
        authorize_url:  "https://stable.bignerdranch.com/oauth/authorize",
        token_url:      "https://stable.bignerdranch.com/oauth/token"
      }

      uid { raw_info["id"] }

      info do
        {
          email:      raw_info["email"],
          full_name:  raw_info["full_name"]
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/users/me.json').parsed
      end

      def email
        (raw_info['email'].nil? || raw_info['email'].empty?) ? '' : raw_info['email']
      end

      def full_name
        (raw_info['full_name'].nil? || raw_info['full_name'].empty?) ? '' : raw_info['full_name']
      end
    end
  end
end
