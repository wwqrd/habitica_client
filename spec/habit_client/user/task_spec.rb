require 'spec_helper'

properties = [:id, :text, :notes, :value, :checklist, :priority,
              :attribute, :tags]

date_properties = [:date_completed, :date_created]

describe 'Task', vcr: { cassette_name: 'task' } do

  let(:habitrpg) { HabitClient.new(USER_ID, API_TOKEN) }
  let(:tasks) { habitrpg.user.tasks }
  let(:todo) { tasks.todos.last }
  let(:habit) { tasks.habits.last }
  let(:daily) { tasks.dailies.last }

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

  context 'Writing to tasks', vcr: { cassette_name: 'write_task' } do

    describe '#save' do

      let(:original_text) { 'Testing 123' }
      let(:updated_text) { 'Testing 456' }
      let(:task) { tasks.create(text: original_text, type: 'todo') }

      it 'can update an existing task' do

        expect(task.text).to eq(original_text)

        task.text = 'Testing 456'
        task.save

        expect(task.text).to eq(updated_text)
      end

    end

  end

end
