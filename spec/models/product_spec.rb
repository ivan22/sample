require 'spec_helper'

describe Product do
  context 'Validation' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :price }
    it { should validate_presence_of :description }
    it { should validate_presence_of :category }
  end

  context 'Association' do
    it { should belong_to :category }
  end
end
