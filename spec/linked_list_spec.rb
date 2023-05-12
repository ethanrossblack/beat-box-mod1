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
end

