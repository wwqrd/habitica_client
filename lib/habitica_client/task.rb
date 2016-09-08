require 'ostruct'
require 'forwardable'
require 'time'
require 'hashup'
require 'habitica_client/restful'

class HabiticaClient

  # A user task, which can be a habit, daily, or todo.
  class Task < HabiticaClient::Restful

    require 'habitica_client/task/date_accessor'
    require 'habitica_client/task/status'
    require 'habitica_client/task/type'

    extend DateAccessor
    include Status
    include Type
    extend Hashup

    endpoint '/tasks'

    attr_accessor :user_id, :reminders, :id, :text, :notes, :value, :priority,
                  :attribute, :type, :tags, :checklist, :value, :priority,
                  :challenge, :down, :up, :history, :streak, :frequency,
                  :history, :completed, :every_x, :repeat, :collapse_checklist,
                  :group

    date_accessor :created_at, :updated_at, :start_date, :date

    hashup :id, :text, :notes, :value, :priority, :attribute, :type, :tags,
           :checklist, :value, :priority, :challenge, :down, :up, :history,
           :streak, :frequency, :history, :completed, :every_x, :repeat,
           :collapse_checklist, :created_at, :updated_at, :start_date, :date

    private

    def url
      return "#{endpoint}/#{id}" unless new?

      "#{endpoint}/user/#{id}"
    end

  end

end
