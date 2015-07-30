class HabiticaClient::User

  # An enumerable object of all the user's tasks.
  #
  # Also contains the endpoint for creating new tasks.
  class Tasks < HabiticaClient::ApiBase

    require 'habitica_client/user/tasks/types'
    require 'habitica_client/user/tasks/status'
    require 'habitica_client/user/task'

    include Enumerable
    include Types
    include Status

    # Iterate over user tasks
    def each(&block)
      tasks.each do |task|
        block.call Task.parse(client, task)
      end
    end

    # Create a new task (and save it to habitrpg.com)
    #
    # @param attributes [Hash] a hash of attributes for the new task.
    def create(attributes = {})
      Task.new(client, attributes).save
    end

    private

    def tasks
      @tasks ||= client.class.get('/user/tasks')
    end

  end

end
