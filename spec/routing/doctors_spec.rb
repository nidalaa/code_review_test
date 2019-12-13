# frozen_string_literal: true

require 'rails_helper'

describe 'doctors router' do
  it 'should route to doctors index action' do
    expect(get('/doctors')).to route_to('doctors#index')
  end

  it 'should route to the doctors show action' do
    expect(get('/doctors/2')).to route_to('doctors#show', id: '2')
  end

  it 'should route to doctors create action' do
    expect(post('/doctors')).to route_to('doctors#create')
  end
end
