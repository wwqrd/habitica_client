require 'ostruct'
require 'forwardable'
require 'time'
require 'hashup'
require 'habit_client/restful'

class HabitClient::User

  class Task < HabitClient::Restful

    require 'habit_client/user/task/date_accessor'
    require 'habit_client/user/task/status'
    require 'habit_client/user/task/type'

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
           :every_x, :repeat, :collapse_checklist

    private

    def endpoint
      '/user/tasks'
    end

  end

end
