require 'rails_helper'

describe Favorito::Presenter do

  context "passing a repos to favorito presenter" do
    before do
      @platform = Favorito::Platform.new(:github, "beck03076")
      @client = Favorito::Client.new(@platform)

      VCR.use_cassette('favorito_client_page_cassettes') do
        @repos = @client.repositories
      end

      @presenter = Favorito::Presenter.new(@repos)
    end

    describe ".sorted_languages_group" do
      it "returns descending sorted hash of languages used with number of times" do
        expect(@presenter.languages_group).to eq({"Ruby"=>11, "JavaScript"=>3, "VimL"=>2, "Unknown"=>2, })
      end
    end


    describe ".languages_group" do
      it "replaces nil programming language to 'unknown' string" do
        expect(@presenter.languages_group).to have_key("Unknown")
      end

      it "does not replace anything if no nil" do
        VCR.use_cassette('favorito_client_page_nonil_cassettes') do
          repos_nonil = @client.repositories
          presenter = Favorito::Presenter.new(repos_nonil)
          expect(presenter.languages_group).to_not have_key("Unknown")
        end
      end

      it "returns hash of languages used with number of times" do
        expect(@presenter.languages_group).to eq({"VimL"=>2, "Ruby"=>11, "Unknown"=>2, "JavaScript"=>3})
      end
    end

    describe ".favorite_language" do
      it "returns favorite language" do
        expect(@presenter.favorite_language).to eq("Ruby")
      end

      it "returns nil if languages group is empty" do
        @presenter.stub(:languages_group) { {} }
        expect(@presenter.favorite_language).to be_nil
      end

    end
  end
end

