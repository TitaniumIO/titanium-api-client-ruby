module TitaniumApi
  module Models
    class BaseModel
      include Virtus.model

      attribute :id, String

      def self.all
        models = []

        opts = {path: self.resource_path}
        response = TitaniumApi.get(opts)

        if response.code == 200
          json     = JSON.parse(response.body, {symbolize_names: true})
          # convert all dasherized keys to underscored keys
          resources = TitaniumApi.underscore_keys(json)

          # map all resources to models
          if !resources.nil? && resources.kind_of?(Array) then
            resources.each do |r|
              models << self.new(r)
            end
          end
        else
          raise "titanium.all returned a non-200 response:#{response.code}\n\n#{response}"
        end

        return models
      end

      def self.find(id)
        model = nil

        opts = {path: self.resource_path + "/" + id}
        response = TitaniumApi.get(opts)

        if response.code == 200
          json     = JSON.parse(response.body, {symbolize_names: true})
          # convert all dasherized keys to underscored keys
          resource = TitaniumApi.underscore_keys(json)
          model    = self.new(resource)
        else
          raise "titanium.find returned a non-200 response:#{response.code}\n\n#{response}"
        end

        return model
      end

    end # class BaseModel
  end # module Models
end # module TitaniumApi
