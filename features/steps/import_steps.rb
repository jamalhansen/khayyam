require File.join(File.dirname(__FILE__), *%w[.. .. spec spec_helper.rb])

Given /^a string containing data to import$/ do
  @data = "topic: dairy\ncategories:\n  cheese:\n    cheddar: ubiquitous\n    blue: crumbly"
end

When /^I tell khayaam to import the string$/ do
  @topic = Khayyam::Topic.import @data
end

Then /^it will import the string into khayyam$/ do
  @topic.class.should eql(Khayyam::Topic)
end

Then /^it will contain all the data in the string$/ do
  @topic.name.should eql("dairy")
  @topic.categories.should eql(["cheese"])
  @topic.regarding("cheese") do |fact|
    fact["cheddar"].should eql("ubiquitous")
    fact["blue"].should eql("crumbly")
  end
end



