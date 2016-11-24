class Module
  def abstract_methods(*names)
    names.each do |name|
      define_method(name) { raise Platforms::NotImplemented }
    end
  end
end
