class HabiticaClient

  # An enumerable object of all the user's tasks.
  #
  # Also contains the endpoint for creating new tasks.
  class Tasks < HabiticaClient::ApiBase

    require 'habitica_client/tasks/types'
    require 'habitica_client/tasks/status'
    require 'habitica_client/task'

    include Enumerable
    include Types
    include Status

    endpoint '/tasks/user'

    # Iterate over user tasks
    def each
      data.each do |task|
        yield Task.parse(client, task)
      end
    end

    # Create a new task (and save it to habitrpg.com)
    #
    # @param attributes [Hash] a hash of attributes for the new task.
    def create(attributes = {})
      Task.new(client, attributes).save
    end

  end

end
