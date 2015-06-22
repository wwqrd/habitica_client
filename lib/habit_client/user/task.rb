require 'ostruct'
require 'forwardable'

class HabitClient::User

  class Task

    require "habit_client/user/task/status"
    require "habit_client/user/task/type"

    include Status
    include Type

    extend Forwardable

    def_delegators :task, :id, :text, :notes, :checklist, :value

    def initialize(tasks, task)
      @tasks = tasks
      @task = OpenStruct.new task
    end

    def client
      @tasks.client
    end

    private

      def task
        @task
      end

  end

end
