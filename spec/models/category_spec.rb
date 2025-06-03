require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "associations" do
    it { should belong_to(:parent).class_name('Category').optional }
    it { should have_many(:subcategories).class_name('Category').with_foreign_key('parent_id').dependent(:destroy) }
  end

  describe "validations" do
    subject { Category.new(name: "Test") }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).scoped_to(:parent_id).with_message("must be unique per parent category") } 
  end
end
