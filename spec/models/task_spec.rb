require 'rails_helper'

RSpec.describe Task, type: :model do

  describe 'タスクモデルのバリデーション' do
    it '全てのフィールドが有効な場合' do
      task = build(:task)
      expect(task).to be_valid
    end

    it 'タイトルが空白の時無効になること' do
      task = build(:task, title: nil)
      expect(task).to be_invalid
      expect(task.errors[:title]).to include("can't be blank")
    end

    it 'タイトルはユニークであること' do
      task1 = create(:task, title: "title")
      task2 = build(:task, title: "title")
      task1.title = task2.title
      task2.valid?
      expect(task2.errors[:title]).to include("has already been taken")
    end

    it 'ステータスが空白の時無効であること' do
      task = build(:task, status: nil)
      expect(task).to be_invalid
      expect(task.errors[:status]).to include("can't be blank")
    end
  end
end
