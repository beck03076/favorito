module Github

  # Client for the GitHub API
  #
  # @see https://developer.github.com
  class Client < Platforms::AbstractClient

    include Github::Configuration
    include Github::Connection
    include Github::Client::UserRepositories

    def initialize(options = {})
      # Use options passed in, but fall back to module defaults
      Github::Configuration.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || Github.instance_variable_get(:"@#{key}"))
      end
    end

  end
end
