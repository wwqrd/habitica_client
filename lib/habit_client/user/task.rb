require 'ostruct'
require 'forwardable'
require 'time'
require 'habit_client/restful'

class HabitClient::User

  class Task < HabitClient::Restful

    require 'habit_client/user/task/date_accessor'
    require 'habit_client/user/task/status'
    require 'habit_client/user/task/type'

    extend DateAccessor
    include Status
    include Type

    attr_accessor :id, :text, :notes, :value, :priority, :attribute,
                  :type, :tags, :checklist, :value, :priority,
                  :challenge, :down, :up, :history, :streak,
                  :frequency, :history, :completed, :every_x, :repeat,
                  :collapse_checklist

    date_accessor :date_created, :date_completed, :start_date, :date

    def endpoint
      '/user/tasks'
    end

    def to_json
      to_h.to_json
    end

    def to_h
      properties = [:id, :text, :notes, :value, :priority, :attribute,
                    :type, :tags, :checklist, :value, :priority,
                    :challenge, :down, :up, :history, :streak,
                    :frequency, :history, :completed, :every_x,
                    :repeat, :collapse_checklist]

      kv = properties.map { |k| [k, send("#{k}")] }
           .delete_if { |_k, v| v.nil? }

      Hash[kv]
    end

  end

end
