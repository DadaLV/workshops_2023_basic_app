require 'rails_helper'

describe 'Log in', type: :feature do
  let(:user) { create(:user) }
  let(:weather_data) do
    {
      'location' => {
        'name' => 'Cracow'
      },
      'current' => {
        'condition' => {
          'text' => 'Sunny',
          'icon' => 'https://cdn.weatherapi.com/weather/64x64/day/113.png'
        },
        'temp_c' => 16
      }
    }
  end

  before do
    allow_any_instance_of(WeatherApiConnector).to receive(:weather_data).and_return(weather_data)
    visit new_user_session_path
  end

  context 'when user is not registered' do
    let(:email) { 'not_existing@email.com' }
    let(:password) { 'password' }

    it 'displays error message' do
      within '#new_user' do
        fill_in 'user_email',	with: email
        fill_in 'user_password',	with: password
        click_button 'Log in'
      end

      expect(page).to have_content('Invalid Email or password.')
    end
  end

  context 'when user is registered' do
    let(:email) { user.email }
    let(:password) { user.password }

    it 'signs user in' do
      within '#new_user' do
        fill_in 'user_email',	with: email
        fill_in 'user_password',	with: password
        click_button 'Log in'
      end

      expect(page).to have_content('Signed in successfully.')
    end
  end
end
