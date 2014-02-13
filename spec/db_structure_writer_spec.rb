require 'spec_helper'

describe DbStructureWriter do
  it 'should have a version number' do
    DbStructureWriter::VERSION.should_not be_nil
  end
end
