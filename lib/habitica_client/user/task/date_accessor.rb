# rubocop:disable Style/UnneededInterpolation

class HabiticaClient::User::Task

  module DateAccessor

    def date_accessor(*attributes)
      attributes.each do |attribute|
        define_method("#{attribute}=") do |date|
          unless date.nil?
            instance_variable_set("@#{attribute}", DateTime.parse(date))
          end
        end

        define_method("#{attribute}") do
          instance_variable_get("@#{attribute}")
        end
      end
    end

  end

end
