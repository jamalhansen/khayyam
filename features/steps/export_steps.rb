require File.join(File.dirname(__FILE__), *%w[.. .. spec spec_helper.rb])

Given /^an object contianing data to export$/ do
  @topic = Khayyam::Topic.new "vi"
  @topic.regarding "movement" do |items|
    items["h"] = "left"
    items["j"] = "up"
    items["k"] = "down"
    items["l"] = "right"
    items["^"] = "beginning of line"
    items["$"] = "end of line"
    items["w"] = "beginning of next word"
  end
end

When /^I tell khayaam to export the file$/ do
  @output = @topic.export
end

Then /^it will export the file$/ do
  @output.should_not eql(nil)
end

Then /^it will contain all the data in the original objects$/ do
  @output.should eql("topic: vi\ncategories: \n  movement: \n    k: down\n    w: beginning of next word\n    l: right\n    $: end of line\n    ^: beginning of line\n    h: left\n    j: up\n")
end


