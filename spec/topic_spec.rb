require File.join(File.dirname(__FILE__), 'spec_helper.rb')

describe Khayyam::Topic do
  it "should take the topic as a string on creation" do
    topic = Khayyam::Topic.new "foo"
    topic.topic.should eql("foo")
  end
  
  it "should store topics and facts" do
    topic = Khayyam::Topic.new "dairy"
    topic.regarding "cheese" do |fact|
      fact["cheddar"] = "ubiquitous"
    end
    
    topic.categories["cheese"].has_key?("cheddar").should eql(true)
    topic.categories["cheese"].length.should eql(1)
    topic.categories["cheese"]["cheddar"].should eql("ubiquitous")
  end
  
  it "should export data to a YAML string" do
    topic = Khayyam::Topic.new "dairy"
    topic.regarding "cheese" do |fact|
      fact["cheddar"] = "ubiquitous"
    end
    
    output = topic.export
    output.should eql("topic: dairy\ncategories: \n  cheese: \n    cheddar: ubiquitous\n")
  end
end

