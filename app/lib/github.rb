module Github

  class << self
    include Github::Configuration

    # Client with default configurable options set
    #
    # @return Github::Client
    def client
      return @client if defined?(@client)
      @client = Github::Client.new(options)
    end

    private

    def respond_to_missing?(method_name, include_private=false)
      client.respond_to?(method_name, include_private)
    end

    def method_missing(method_name, *args, &block)
      if client.respond_to?(method_name)
        return client.send(method_name, *args, &block)
      else
        super
      end
    end
  end

end

Github.setup
Github::Error
