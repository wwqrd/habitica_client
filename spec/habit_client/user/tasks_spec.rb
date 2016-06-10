require 'spec_helper'

describe 'Tasks', vcr: { cassette_name: 'tasks' } do

  let(:habitrpg) { HabiticaClient.new(USER_ID, API_TOKEN) }
  let(:tasks) { habitrpg.user.tasks }

  describe '.each' do

    it 'can be iterated' do
      tasks.each do |task|
        expect(task).to be_a(HabiticaClient::User::Task)
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
        task.delete # Don't leave tasks in my todo list!
      end

    end

  end

end
