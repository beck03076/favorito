module Github

  # Network layer for API clients.
  module Connection

    # Make a HTTP GET request
    #
    # @return Faraday Response
    def get(url, options = {})
      request :get, url, {}, prepare_options(options)
    end

    def post(url, options = {})
      request :post, url, options
    end

    def put(url, options = {})
      request :put, url, options
    end

    def delete(url, options = {})
      request :delete, url, options
    end

    # Make one or more HTTP GET requests, optionally fetching
    # the next page of results from URL in Link response header based
    # on value in {#auto_paginate}.
    #
    # @param url [String] The path, relative to {#api_endpoint}
    # @param options [Hash] Query and header params for request
    # @param block [Block] Block to perform the data concatination of the
    #   multiple requests. The block is called with two parameters, the first
    #   contains the contents of the requests so far and the second parameter
    #   contains the latest response.
    # @return [Sawyer::Resource]
    def paginate(url, options = {}, &block)
      opts = prepare_options(options)

      if @per_page
        opts[:query][:per_page] ||=  @per_page
      end

      data = request(:get, url, {}, opts)

      while @prev_response.rels[:next]
        print "."
        @prev_response = @prev_response.rels[:next].get
        if block_given?
          yield(data, @prev_response)
        else
          data.concat(@prev_response.data) if @prev_response.data.is_a?(Array)
        end
      end

      data
    end

    def prepare_options(options)
      opts = Hash.new
      opts[:query] = options.fetch(:query,{})
      opts[:headers] = options.fetch(:headers,{})
      opts
    end

    # Hypermedia agent for the GitHub API
    #
    # @return [Sawyer::Agent]
    def agent
      @agent ||= Sawyer::Agent.new(endpoint, sawyer_options)
    end

    # Response for last HTTP request
    #
    # @return [Sawyer::Response]
    def prev_response
      @prev_response if defined? @prev_response
    end

    protected

    def endpoint
      api_endpoint
    end

    private

    def reset_agent
      @agent = nil
    end

    def request(method, path, data, options = {})
      @prev_response = response = agent.call(method, URI::Parser.new.escape(path.to_s), data, options)
      response.data
    end

    def sawyer_options
      opts = {
        :links_parser => Sawyer::LinkParsers::Simple.new
      }
      conn_opts = @connection_options
      opts[:faraday] = Faraday.new(conn_opts)
      opts
    end
  end
end
