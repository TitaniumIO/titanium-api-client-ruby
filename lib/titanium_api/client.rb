module TitaniumApi
  class Client

    #BASE_API_PATH = 'http://api.titanium.io/'
    BASE_API_PATH = 'http://localhost:4000/'
    API_VERSION = 'v1/'

    attr_reader :headers

    def self.setup(key, secret=nil)
      @_titanium_api_client = new(key, secret)
    end

    def base_path
      TitaniumApi::Client::BASE_API_PATH + TitaniumApi::Client::API_VERSION
    end

    def self.client
      raise "titanium api client has not been initialized!" unless @_titanium_api_client
      return @_titanium_api_client
    end

    def initialize(key, secret)
      if secret != nil && secret.length > 0
        auth = "HMAC-SHA256 Credential=#{key},Signature=#{''}"
      else
        auth = "API-KEY Credential=#{key}"
      end

      @headers =  {
                    'Authorization' => auth,
                    'Accept' => 'application/json',
                    'Content-Type' => 'application/json'
                  }
    end
  end # Client
end # module TitaniumApi
