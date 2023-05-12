require "./lib/linked_list"
require "./lib/node"
require "rspec"

describe LinkedList do

  it "exists" do
    list = LinkedList.new
    
    expect(list).to be_a(LinkedList)
  end
  
  it "starts with an empty @head" do
    list = LinkedList.new
    
    expect(list.head).to be nil
  end
  
  it "can append one Node to its head" do
    list = LinkedList.new
    list.append("doop")

    expect(list.head).to be_a(Node)
  end
  
  it "doesn't lead to a next node with only one node" do
    list = LinkedList.new
    list.append("doop")
  
    expect(list.head.next_node).to be nil
  end
  
  it "can count one node" do
    list = LinkedList.new
    list.append("doop")
  
    expect(list.count).to eq(1)
  end
end

