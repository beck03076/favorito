module Favorito
  class Platform
    attr_accessor :name, :username, :options

    def initialize(name, username, opts = {})
      @name = name
      @username = username
      @options = { query: opts }
    end

  end
end
