class Train
  attr_reader :number_carriage, :number, :type, :speed, :station, :is_move, :route

  def initialize(number, type, number_carriage)
    @number = number
    @type = type
    @number_carriage = number_carriage
    @speed = 0
  end

  def accelerate(speed = 10)
    @speed += speed
  end

  def slow_down(speed = 10)
    @speed = @speed < speed ? 0 : @speed - speed
  end

  def attach_carriage(count = 1)
    if !validate_speed?
      @number_carriage += count
    else
      puts 'Поезд движется'
      @number_carriage
    end
  end

  def detach_carriage(count = 1)
    if !validate_speed?
      @number_carriage = @number_carriage < count ? 0 : @number_carriage - count
    else
      puts 'Поезд движется'
      @number_carriage
    end
  end

  def route(route)
    @route = route
    @station = @route.stations.first
    puts "Вы на станции: #{@station}"
    @route.get_stations_list
  end

  def go_ahead
    @station = next_station if next_station
  end

  def go_back
    @station = get_previous_station if get_previous_station
  end

  def next_station
    index = @route.stations.index @station
    length = @route.stations.length
    if index == length
      puts 'вы на последней станции'
    else
      @route.stations[index + 1]
    end
  end

  def get_previous_station
    index = @route.stations.index @station
    if index == 0
      puts 'Вы на первой станции'
    else
      @route.stations[index - 1]
    end
  end

  private

  def validate_speed?
    @speed > 0
  end
end
