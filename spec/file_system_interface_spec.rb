require 'helper'

describe Potatochop::FileSystemInterface do
  describe '#new' do
    it 'creates a new FileSystemInterface object with the proper source'
  end
  describe '#exists?' do
    it 'returns true if the given file exists'
    it 'returns false if the given file does not exist'
  end
end