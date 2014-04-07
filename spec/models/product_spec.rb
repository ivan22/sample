require 'spec_helper'

describe Product do
  context 'Validation' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :price }
    it { should validate_presence_of :description }
  end
end
