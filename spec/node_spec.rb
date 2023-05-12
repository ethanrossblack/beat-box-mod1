require "./lib/node"
require "rspec"

describe Node do
  it "exists" do
    node = Node.new("bloop")

    expect(node).to be_a(Node)
  end

  
end