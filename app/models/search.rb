class Search
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :username

  def persisted?
    false
  end

  def self.perform(params)
    search = self.new
    search.username = params[:username]
    search.fetch_repositories
  end

  def fetch_repositories
    client.repositories
  end

  private

  def client
    @client ||= Favorito::Client.new(platform)
  end


  def platform
    @platform ||= Favorito::Platform.new(:github,@username)
  end

end
