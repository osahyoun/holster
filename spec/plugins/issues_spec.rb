require 'spec_helper'
require 'plugins/issues'

describe Plugins::Issues do
  describe 'issue parser' do
    subject { Plugins::Issues::Parser.new text }

    context 'with all options' do
      let(:text) { "Fix homepage | Homepage graphic is wrong | assign: bob" }

      its(:assignee) { should == 'bob' }
      its(:title) { should == 'Fix homepage' }
      its(:body) { should == 'Homepage graphic is wrong' }
      its(:to_hash) { should == { title: 'Fix homepage', assignee: 'bob', body: 'Homepage graphic is wrong'} }
    end

    context 'just simple' do
      let(:text) { "title | body" }

      its(:title) { should == "title" }
      its(:body) { should == "body" }
    end
  end
end
