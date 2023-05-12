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
  
  it "can return data of the head node" do
    list = LinkedList.new
    list.append("doop")
    
    expect(list.to_string).to eq("doop")
  end
  
  it "can append multiple nodes" do
    list = LinkedList.new
    list.append("doop")

    expect(list.head.next_node).to be nil

    list.append("deep")

    expect(list.head.next_node).to be_a(Node)
  end

  it "can count multiple nodes" do
    list = LinkedList.new
    list.append("doop")

    expect(list.count).to eq(1)

    list.append("deep")

    expect(list.count).to eq(2)
  end

  it "can return data from multiple nodes" do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")

    expect(list.to_string).to eq("doop deep")
  end

  it "can add nodes to the beginning of a list" do
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    expect(list.to_string).to eq("plop suu")

    list.prepend("dop")
    expect(list.to_string).to eq("dop plop suu")
    expect(list.head.data).to eq("dop")
    expect(list.head.next_node.data).to eq("plop")
  end

  it "can insert a node into a given position on the list" do
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.prepend("dop")
    expect(list.to_string).to eq("dop plop suu")

    list.insert(1, "woo")
    expect(list.to_string).to eq("dop woo plop suu")
  end

  it "can find a node chain of certain length" do
    list = LinkedList.new
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    expect(list.find(2,1)).to eq("shi")
    expect(list.find(1,3)).to eq("woo shi shu")
    expect(list.find(0,5)).to eq("deep woo shi shu blop")
  end

  it "can return a boolean of whether or not a supplied value is in the list" do
    list = LinkedList.new
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    expect(list.includes?("deep")).to be true
    expect(list.includes?("dep")).to be false
  end

end