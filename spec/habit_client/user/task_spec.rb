require 'spec_helper'

describe 'Task', :vcr do

  let(:habitrpg) { HabitClient.new(USER_ID, API_TOKEN) }

  let(:task) { habitrpg.user.tasks.first }

  describe '#id' do
    it 'is the task id' do
      expect(task.id).to be_a(String)
    end
  end

  describe '#completed?' do
    it 'is the completed status' do
      expect(task).to respond_to(:completed?)
    end
  end

  describe '#text' do
    it 'is the task description' do
      expect(task.text).to be_a(String)
    end
  end

  describe '#notes' do
    it 'is the task notes' do
      expect(task.notes).to be_a(String)
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
