module TitaniumApi
  class Client

    BASE_API_PATH = 'http://api.titanium.io/'
    API_VERSION = 'v1/'

    attr_reader :headers

    def self.setup(access_key, secret_key)
      @_titanium_api_client = new(access_key, secret_key)
    end

    def base_path
      TitaniumApi::Client::BASE_API_PATH + TitaniumApi::Client::API_VERSION
    end

    def self.client
      raise "titanium api client has not been initialized!" unless @_titanium_api_client
      return @_titanium_api_client
    end

    def initialize(access_key, secret_key)
      @headers =  {
                    'Authorization' => "ApiKey #{access_key}:#{secret_key}",
                    'Accept' => 'application/json',
                    'Content-Type' => 'application/json'
                  }
    end
  end # Client
end # module TitaniumApi
