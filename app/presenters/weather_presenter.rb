class WeatherPresenter
  def initialize(data)
    @data = data
  end

  def nice_weather?
    description = data["current"]["condition"]["text"]
    description == 'Sunny' || description == 'Partly cloudy'
  end

  def location
    "#{data["location"]["name"]}"
  end

  def temperature
    "#{data["current"]["temp_c"].to_s}"
  end

  def condition
    "#{data["current"]["condition"]["text"]}"
  end

  def icon
    data["current"]["condition"]["icon"]
  end

  def good_to_read_outside?
    nice_weather? && data["current"]["temp_c"] > 15
  end

  def encourage_text
    if good_to_read_outside?
      "Get some snacks and go read a book in a park!"
    else
      "It's always a good weather to read a book!"
    end
  end

  private
  attr_reader :data
end