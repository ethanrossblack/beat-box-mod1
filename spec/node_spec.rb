require "./lib/node"
require "rspec"

describe Node do

  it "exists" do
    node = Node.new("plop")

    expect(node).to be_a(Node)
  end

  it "can return data" do
    node = Node.new ("plop")
    
    expect(node.data).to eq("plop")
  end
  
  it "points to the next node" do
    node = Node.new ("plop")
    
    expect(node.next_node).to be nil
  end


end