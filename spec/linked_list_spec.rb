require "./lib/linked_list"
require "./lib/node"
require "rspec"

describe LinkedList do

  it "exists" do
    list = LinkedList.new

    expect(list).to be_a(LinkedList)
  end

end

