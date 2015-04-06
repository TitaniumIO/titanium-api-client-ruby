require 'titanium_api/version'

require 'active_support'
require 'active_support/inflector'

require 'rest-client'
require 'virtus'
require 'byebug'

require 'titanium_api/client'
require 'titanium_api/models'

module TitaniumApi
  def self.client
    TitaniumApi::Client.client
  end

  def self.get(opts={})
    path = self.client.base_path + opts[:path]
    RestClient.get(path, self.client.headers) { |response, request, result, &block| response }
  end

  def self.underscore_keys(json)
    data = json[:data]

    # convert all dasherized keys to underscored keys
    if data.instance_of? Array
      data = []
      json[:data].each do |resource|
        hash = {}
        resource.map {|k, v| hash[k.to_s.underscore.to_sym] = resource[k]}
        data << hash
      end
    elsif data
      data = {}
      resource = json[:data]
      resource.map{|k,v| data[k.to_s.underscore.to_sym] = resource[k]}
    end

    return data
  end # self.underscore_keys

  def self.dasherize_keys(json)
    dasherizedJson = {}
    json.map {|k, v| dasherizedJson[k.to_s.dasherize.to_sym] = json[k]}

    return {data: dasherizedJson}
  end # self.dasherize_keys
end
