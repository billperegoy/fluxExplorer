require_relative './spec_helper'

describe ActionCreator do
  it 'should initialize with no stored actions' do
    action_creator = ActionCreator.new
    expect(action_creator.actions).to be_empty
  end

  it 'should accept an action and store it' do
    action_creator = ActionCreator.new
    action_creator.create(:action_name)
    expect(action_creator.actions.length).to eq(1)
  end

  it 'should accepot multiple actions and keep them queued' do
    action_creator = ActionCreator.new
    action_creator.create(:action_name_1)
    action_creator.create(:action_name_2)
    expect(action_creator.actions.length).to eq(2)
  end

  it 'should accepot a read request which removes the first enetered action' do
    action_creator = ActionCreator.new
    action_creator.create(:action_name_1)
    action_creator.create(:action_name_2)

    result = action_creator.read
    expect(result).to eq(:action_name_1)
    expect(action_creator.actions.length).to eq(1)
  end
end
