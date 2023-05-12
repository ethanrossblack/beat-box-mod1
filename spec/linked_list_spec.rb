require "./lib/linked_list"
require "./lib/node"
require "rspec"

describe LinkedList do

  it "exists" do
    list = LinkedList.new

    expect(list).to be_a(LinkedList)
  end

  it "starts with an empty head" do
    list = LinkedList.new
    
    expect(list.head).to be nil
  end
  
  it "can append one new node" do
    list = LinkedList.new
    list.append("doop")
    
    expect(list.head).to be_a(Node)
  end
  
  it "can point to a nil tail with a single head node" do
    list = LinkedList.new
    list.append("doop")
    
    expect(list.head.next_node).to be nil
  end
  
  it "can count how many things are in the list" do
    list = LinkedList.new
    list.append("doop")
    # require "pry"; binding.pry
    expect(list.count).to eq(1)
  end
  
  it "can return a string of the first node" do
    list = LinkedList.new
    list.append("doop")

    expect(list.to_string).to eq("doop")
  end

end

