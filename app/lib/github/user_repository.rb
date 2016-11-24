module Github

  # Class to parse GitHub repository owner and name from
  # URLs and to generate URLs
  class UserRepository
    attr_accessor :username
    USERNAME_PATTERN = /^[a-zA-Z0-9_\.]*$/

    # Instantiate from a GitHub repository URL
    #
    # @return [Repository]
    # @raise [Octokit::InvalidRepository] if the repository
    #   has an invalid format
    def initialize(username)
      @username = username
      validate_username!
    end

    def public_users_path
      "users/#{@username}"
    end

    # Repository owner/name
    # @return [String]
    def public_user_repos_path
      "users/#{@username}/repos"
    end
    # Repository URL based on {Octokit::Client#web_endpoint}
    # @return [String]
    def url
      "#{Github.api_endpoint}/#{public_user_repos_path}"
    end

    private

    def validate_username!
      if (@username !~ USERNAME_PATTERN) || @username.blank?
        raise_invalid_username!
      end
    end

    def raise_invalid_username!
      raise Github::InvalidUsername, "Invalid Github Username. Please enter a valid username!"
    end
  end
end
