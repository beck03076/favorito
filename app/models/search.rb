class Search
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :username

  def persisted?
    false
  end

end
