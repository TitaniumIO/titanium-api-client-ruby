module TitaniumApi
  module Models
    class Configuration < TitaniumApi::Models::BaseModel
      attribute :name, String
      attribute :configuration_items, Array[TitaniumApi::Models::ConfigurationItem]

      def self.resource_path
        "configurations"
      end

    end # class Configuration
  end # module Models
end # module TitaniumApi
