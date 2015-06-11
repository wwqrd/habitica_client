require 'spec_helper'

describe 'Tasks', :vcr do

  let(:habitrpg) { HabitClient.new(USER_ID, API_TOKEN) }

  let(:tasks) { habitrpg.user.tasks }

  describe '.each' do

    it 'can be iterated' do
      tasks.each do |task|
        expect(task).to be_a(HabitClient::User::Task)
      end
    end

  end

  describe '.habits' do

    it 'returns all the habits' do
      tasks.habits do |task|
        expect(task.habit?).to be(true)
      end
    end

  end

  describe '.todos' do

    it 'returns all the todos' do
      tasks.todos do |task|
        expect(task.todo?).to be(true)
      end
    end

  end

  describe '.dailys' do

    it 'returns all the dailys' do
      tasks.dailys do |task|
        expect(task.daily?).to be(true)
      end
    end

  end

  describe '.completed' do

    it 'returns all the completed tasks' do
      tasks.completed do |task|
        expect(task.completed?).to be(true)
      end
    end

  end

  describe '.uncompleted' do

    it 'returns all the uncompleted tasks' do
      tasks.uncompleted do |task|
        expect(task.completed?).to be(false)
      end
    end

  end

end
