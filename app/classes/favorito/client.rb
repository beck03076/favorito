module Favorito
  class Client < Platforms::AbstractClient

    def initialize(platform)
      @platform = platform
      @options =  platform.options
    end

    def valid_user?
      client.valid_user?(user_repo, @options)
    end

    def repositories
      client.repositories(user_repo, @options)
    end

    private

    def client
      @client ||= platform_klass::Client.new(@options)
    end

    def user_repo
      @user_repo ||= platform_klass::UserRepository.new(@platform.username)
    end

    def platform_klass
      @platform.name.to_s.classify.constantize
    end
  end
end