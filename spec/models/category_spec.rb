require 'spec_helper'

describe Category do
  context 'validation' do
    it { should validate_presence_of :title }
  end

  context 'association' do
    it { should have_many :products }
  end
end
