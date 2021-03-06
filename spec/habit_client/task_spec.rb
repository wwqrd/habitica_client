require 'spec_helper'

properties = [:id, :text, :notes, :value, :checklist, :priority,
              :attribute, :tags]

date_properties = [:created_at, :updated_at]

describe 'Task', vcr: { cassette_name: 'task' } do

  let(:habitrpg) { HabiticaClient.new(USER_ID, API_TOKEN) }
  let(:tasks) { habitrpg.tasks }
  let(:todo) { tasks.todos.last }
  let(:habit) { tasks.habits.last }
  let(:daily) { tasks.dailies.last }
  dummy_tasks = nil

  before do
    dummy_tasks = {
      todo: tasks.create(text: 'Testing 123', type: 'todo'),
      habit: tasks.create(text: 'Testing 123', type: 'habit'),
      daily: tasks.create(text: 'Testing 123', type: 'daily')
    }
  end

  after do
    # Don't leave tasks in my todo list!
    dummy_tasks.each { |_k, t| t.delete }

  end

  describe '#completed?' do
    it 'is the completed status' do
      expect(todo).to respond_to(:completed?)
    end
  end

  describe 'Task properties' do

    properties.each do |property|
      describe "##{property}" do
        it 'is not nil' do
          expect(todo).to respond_to(property)
        end
      end
    end
    date_properties.each do |property|
      describe "##{property}" do
        it 'is a DateTime' do
          expect(todo.send(property)).to be_a(DateTime)
        end
      end
    end
  end

  context 'is a habit' do
    describe '#habit?' do
      it 'is true' do
        expect(habit.habit?).to eq(true)
        expect(habit.daily?).to eq(false)
      end
    end
  end

  context 'is a daily' do
    describe '#daily?' do
      it 'is true' do
        expect(daily.daily?).to eq(true)
        expect(daily.todo?).to eq(false)
      end
    end
  end

  context 'is a todo' do
    describe '#todo?' do
      it 'is true' do
        expect(todo.todo?).to eq(true)
        expect(todo.habit?).to eq(false)
      end
    end
  end

  context 'Deleting tasks', vcr: { cassette_name: 'delete_task' } do

    describe '#delete' do

      it 'can delete a task' do
        task = tasks.create(text: 'Delete me', type: 'todo')
        expect(task.delete).to eq(true)
      end

    end

  end

  context 'Updating tasks', vcr: { cassette_name: 'update_task' } do

    describe '#save' do

      let(:original_text) { 'Testing 123' }
      let(:updated_text) { 'Testing 456' }

      it 'can update an existing task' do
        task = tasks.create(text: original_text, type: 'todo')

        expect(task.text).to eq(original_text)

        task.text = 'Testing 456'
        task.save

        expect(task.text).to eq(updated_text)

        task.delete # Don't leave tasks in my todo list!
      end

    end

  end

end
