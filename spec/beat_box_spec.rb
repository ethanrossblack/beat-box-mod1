require "./lib/beat_box"
require "./lib/linked_list"
require "./lib/node"
require "rspec"

describe BeatBox do
  it "exists" do
    bb = BeatBox.new

    expect(bb).to be_a(BeatBox)
  end

  it "creates an empty LinkedList item on initialization" do
    bb = BeatBox.new

    expect(bb.list).to be_a(LinkedList)
    expect(bb.list.head).to be nil
  end
end