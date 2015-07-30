require 'ostruct'
require 'forwardable'
require 'time'
require 'hashup'
require 'habitica_client/restful'

class HabiticaClient::User

  # A user task, which can be a habit, daily, or todo.
  class Task < HabiticaClient::Restful

    require 'habitica_client/user/task/date_accessor'
    require 'habitica_client/user/task/status'
    require 'habitica_client/user/task/type'

    extend DateAccessor
    include Status
    include Type
    extend Hashup

    attr_accessor :id, :text, :notes, :value, :priority, :attribute,
                  :type, :tags, :checklist, :value, :priority,
                  :challenge, :down, :up, :history, :streak,
                  :frequency, :history, :completed, :every_x, :repeat,
                  :collapse_checklist

    date_accessor :date_created, :date_completed, :start_date, :date

    hashup :id, :text, :notes, :value, :priority, :attribute, :type,
           :tags, :checklist, :value, :priority, :challenge, :down,
           :up, :history, :streak, :frequency, :history, :completed,
           :every_x, :repeat, :collapse_checklist, :date_created,
           :date_completed, :start_date, :date

    private

    def endpoint
      '/user/tasks'
    end

  end

end
