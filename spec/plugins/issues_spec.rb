require 'spec_helper'
require 'plugins/issues'

describe Plugins::Issues do
  describe 'issue parser' do
    subject { Plugins::Issues::Parser.new text }

    context 'with all options' do
      let(:text) { "web | Fix homepage | Homepage graphic is wrong | assign: bob" }

      its(:repos) { should == 'web' }
      its(:assignee) { should == 'bob' }
      its(:title) { should == 'Fix homepage' }
      its(:body) { should == 'Homepage graphic is wrong' }
      its(:to_hash) { should == { title: 'Fix homepage', assignee: 'bob', body: 'Homepage graphic is wrong'} }
    end

    context 'just simple' do
      let(:text) { "web | title | body" }
      
      its(:repos) { should == 'web' }
      its(:title) { should == "title" }
      its(:body) { should == "body" }
    end
  end
end
