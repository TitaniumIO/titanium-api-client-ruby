module TitaniumApi
  module Models
    class ConfigurationItem
      include Virtus.model

      attribute :name, String
      attribute :value, String
    end # class ConfigurationItem
  end # module Models
end # module TitaniumApi
