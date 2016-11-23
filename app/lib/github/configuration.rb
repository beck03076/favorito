module Github
  # Configuration options for client
  module Configuration

    attr_accessor :per_page, :api_endpoint, :web_endpoint,
      :connection_options, :default_media_type, :user_agent, :content_type

    class << self
      # Configuration keys for {Github::Client}
      # @return [Array]
      # more keys can be added later like client_id and client_token
      def keys
        @keys ||= [
          :api_endpoint,
          :connection_options,
          :per_page,
          :web_endpoint,
          :default_media_type,
          :content_type,
          :user_agent
        ]
      end
    end

    # Reset configuration options to default values
    def setup
      Github::Configuration.keys.each do |key|
        instance_variable_set(:"@#{key}", Github::Default.options[key])
      end
      self
    end

    private

    def options
      Hash[Github::Configuration.keys.map{|key| [key, instance_variable_get(:"@#{key}")]}]
    end

  end
end
