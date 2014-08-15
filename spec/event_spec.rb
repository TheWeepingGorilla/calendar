require 'spec_helper'

describe 'Event' do
  it "returns events without a start time when called with that scope" do
    new_event = Event.create({:description => "Hi", :location => "Ho"})
    expect(Event.no_start[0]).to eq new_event
  end
end
