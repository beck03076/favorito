module Favorito
  class Presenter < SimpleDelegator
    UNKNOWN_LANG = "Unknown"

    def sorted_languages_group
      languages_group.sort_by{ |key, value| -value }
    end

    def favorite_language
      group = languages_group
      group.max_by{|key,value| value }[0] if valid?(group)
    end

    def languages_group
      @languages_group ||= languages.inject(Hash.new(0)) { |hash, language|
        language ||= UNKNOWN_LANG
        hash[language] += 1
        hash
      }
    end

    private

    def valid?(group)
      group.is_a?(Hash) && !group.empty?
    end

    def languages
      @languages ||= model.pluck(:language)
    end

    def model
      __getobj__
    end
  end
end
