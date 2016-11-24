class Search
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :username

  def persisted?
    false
  end

  def self.perform
    # platform = Favorito::Platform.new(:github,'cthulhu', { per_page: 100})
    # client = Favorito::Client.new(platform)
  end

end
