require 'ostruct'
require 'forwardable'
require 'time'

class HabitClient::User

  class Task

    require 'habit_client/user/task/status'
    require 'habit_client/user/task/type'

    include Status
    include Type

    extend Forwardable

    def_delegators :task, :id, :text, :notes, :checklist, :value,
                   :priority, :attribute, :tags, :date_created,
                   :date_completed

    def initialize(tasks, task)
      @tasks = tasks
      @task = OpenStruct.new(Task.parse(task))
    end

    def client
      @tasks.client
    end

    def self.parse(task)
      task.tap do |t|
        if(t.has_key?('dateCompleted'))
          t['date_completed'] = DateTime.parse(t['dateCompleted'])
          t.delete('dateCompleted')
        end
        if(t.has_key?('dateCreated'))
          t['date_created'] = DateTime.parse(t['dateCreated'])
          t.delete('dateCreated')
        end
      end
    end

    private

      def task
        @task
      end

  end

end
