require 'spec_helper'

properties = [:id, :text, :notes, :value, :checklist]

describe 'Task', :vcr do

  let(:habitrpg) { HabitClient.new(USER_ID, API_TOKEN) }

  let(:task) { habitrpg.user.tasks.todos.first }

  describe '#completed?' do
    it 'is the completed status' do
      expect(task).to respond_to(:completed?)
    end
  end

  describe 'Task properties' do
    properties.each do |property|
      describe "##{property}" do
        it 'is not nil' do
          expect(task.send(property)).to_not be_nil
        end
      end
    end
  end

  describe '#habit?' do
    it 'is a habit type task' do
      expect(task).to respond_to(:habit?)
    end
  end

  describe '#daily?' do
    it 'is a daily type task' do
      expect(task).to respond_to(:daily?)
    end
  end

  describe '#todo?' do
    it 'is a todo type task' do
      expect(task).to respond_to(:todo?)
    end
  end

end
