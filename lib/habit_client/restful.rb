class HabitClient

  class Restful < ApiBase

    module ClassMethods

      def parse(client, attributes)
        new(client, remap(attributes))
      end

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

    extend ClassMethods

    def initialize(client, attributes = {})
      self.attributes = attributes
      super(client)
    end

    def attributes=(attributes)
      attributes.each { |k, v| send("#{k}=", v) }
    end

    def new?
      id.nil?
    end

    def save
      response = put || post

      self.attributes = self.class.remap(response)

      self
    end

    def delete
      return nil if new?

      response = client.class.delete(url)
      response.ok?
    end

    private

    def url
      return "#{endpoint}/#{id}" unless new?

      endpoint
    end

    def post
      return nil unless new?

      response = client.class.post(url,
                                   body: to_json)
      response.parsed_response
    end

    def put
      return nil if new?

      response = client.class.put(url,
                                  body: to_json)
      response.parsed_response
    end

  end

end
