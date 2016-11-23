module Github
  class Client
    module UserRepositories
      attr_reader :valid

      # Get a single repository
      #
      # @see https://developer.github.com/v3/repos/#get
      # @see https://developer.github.com/v3/licenses/#get-a-repositorys-license
      # @param repo [Integer, String, Hash, Repository] A GitHub repository
      # @return [Sawyer::Resource] Repository information
      def valid_user?(repo, options= {})
        response = get(repo.public_users_path, options)
        @valid ||= response[:id].present?
        @valid
      end

      def repositories(repo, options = {})
        if valid_user?(repo)
          paginate repo.public_user_repos_path, options
        else
          raise Github::UserNotFound, "This username is not on github yet!"
        end
      end
    end
  end
end
