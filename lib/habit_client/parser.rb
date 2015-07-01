class HabitClient

  module Parser

    def remap(attributes)
      remapped = attributes.map do |k, v|
        [k.gsub(/([a-z\d])([A-Z])/, '\1_\2').downcase, v]
      end

      remapped.delete_if do |k, _v|
        k.match(/^_/)
      end

      Hash[remapped]
    end

  end

end
