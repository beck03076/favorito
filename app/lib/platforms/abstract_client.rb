module Platforms

  class AbstractClient
    abstract_methods :repositories, :valid_user?

    def initialize(opts = nil)
      raise Platforms::CannotInstantiate
    end

  end
end

Platforms::Error
