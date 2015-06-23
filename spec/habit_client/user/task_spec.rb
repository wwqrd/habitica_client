require 'spec_helper'

properties = [:id, :text, :notes, :value, :checklist, :priority,
              :attribute, :tags]

date_properties = [:date_completed, :date_created]

describe 'Task' do

  todo = nil
  habit = nil
  daily = nil

  VCR.use_cassette :task do
    habitrpg = HabitClient.new(USER_ID, API_TOKEN)
    tasks = habitrpg.user.tasks
    todo = tasks.todos.last
    habit =  tasks.habits.last
    daily = tasks.dailies.last
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

end
