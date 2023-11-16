require 'rails_helper'

describe 'Book Loan', type: :feature do
  let(:user) { create(:user) }
  let(:book) { create(:book) }
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
    within '#new_user' do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log in'
    end
  end

  it 'allows the user to create a book loan' do
    book1 = create(:book)
    visit books_path

    allow_any_instance_of(UserCalendarNotifier).to receive(:insert_event) do
      double(id: 'mock_event_id')
    end

    click_button 'Loan'
    expect(page).to have_content('Book Loan was successfully created.')
  end

  it 'allows the user to cancel a book loan' do
    book = create(:book)
    book_loan = create(:book_loan, user: user, book: book)
    visit book_requests_path
    click_button 'Cancel'
    expect(page).to have_content('Book loan was successfully cancelled.')
  end
end
