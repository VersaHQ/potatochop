require 'helper'

describe Potatochop::FileSystemInterface do
  describe '#new' do
    it 'creates a new FileSystemInterface object with the proper source' do
      fs = Potatochop::FileSystemInterface.new('spec/fake_site')
      fs.source.should == "spec/fake_site"
    end
  end
  describe '#exists?' do
    it 'returns true if the given file exists' do
      fs = Potatochop::FileSystemInterface.new('spec/fake_site')
      fs.exists?('foo.html.haml').should be_true
    end
    
    it 'returns false if the given file does not exist' do
      fs = Potatochop::FileSystemInterface.new('spec/fake_site')
      fs.exists?('not_real.html').should be_false
    end
  end
  
  describe '#read' do
    it 'returns the content of the given files' do
      fs = Potatochop::FileSystemInterface.new('spec/fake_site')
      fs.read('foo.html.haml').should == File.read('spec/fake_site/foo.html.haml')
    end
    
    it 'returns false if the given file does not exist' do
      fs = Potatochop::FileSystemInterface.new('spec/fake_site')
      expect { fs.read('not_real.html') }.to raise_error
    end
  end
end