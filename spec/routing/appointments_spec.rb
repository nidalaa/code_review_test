# frozen_string_literal: true

require 'rails_helper'

describe 'appointments router' do
  it 'should route to appointments index action' do
    expect(get('/appointments')).to route_to('appointments#index')
  end

  it 'should route to appointments create action' do
    expect(post('/appointments')).to route_to('appointments#create')
  end
end
