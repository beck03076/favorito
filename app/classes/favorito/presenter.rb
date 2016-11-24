module Favorito
  class Presenter < SimpleDelegator
    UNKNOWN_LANG = "Unknown"

    def favorite_language
      languages_group.max_by{|key,value| value }[0]
    end

    def languages_group
      languages.inject(Hash.new(0)) { |hash, language|
        language ||= UNKNOWN_LANG
        hash[language] += 1
        hash
      }
    end

    private

    def languages
      @languages ||= model.pluck(:language)
    end

    def model
      __getobj__
    end
  end
end
