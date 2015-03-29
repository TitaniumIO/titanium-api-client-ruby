require 'rest-client'

class TitaniumApi
  attr_reader :headers

  BASE_API_PATH = 'http://api.titanium.io/'
  API_VERSION = 'v1/'

  def initialize(headers)
    @headers = headers
  end

  def url(path)
    BASE_API_PATH + API_VERSION + path
  end

end # class TitaniumApi
