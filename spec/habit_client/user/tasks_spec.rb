require 'spec_helper'

describe 'Tasks' do

  tasks = nil

  VCR.use_cassette :tasks do
    habitrpg = HabitClient.new(USER_ID, API_TOKEN)
    tasks = habitrpg.user.tasks
    # This is bad, we shouldn't know the internal workings of the class
    tasks.tasks
  end

  describe '.each' do

    it 'can be iterated' do
      tasks.each do |task|
        expect(task).to be_a(HabitClient::User::Task)
      end
    end

  end

  describe '.habits' do

    it 'returns all the habits' do
      tasks.habits.each do |task|
        expect(task.habit?).to be(true)
      end
    end

  end

  describe '.todos' do

    it 'returns all the todos' do
      tasks.todos.each do |task|
        expect(task.todo?).to be(true)
      end
    end

  end

  describe '.dailies' do

    it 'returns all the dailies' do
      tasks.dailies.each do |task|
        expect(task.daily?).to be(true)
      end
    end

  end

  describe '.completed' do

    it 'returns all the completed tasks' do
      tasks.completed.each do |task|
        expect(task.completed?).to be(true)
      end
    end

  end

  describe '.uncompleted' do

    it 'returns all the uncompleted tasks' do
      tasks.uncompleted.each do |task|
        expect(task.completed?).to be(false)
      end
    end

  end

  context 'Creating tasks', vcr: { cassette_name: 'create_task' } do

    describe '#create' do

      it 'can create a new task' do
        task = tasks.create(text: 'Testing 123', type: 'todo')
        expect(task.id).not_to be_nil
      end

    end

  end

end
