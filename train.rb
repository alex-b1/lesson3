class Train
  attr_reader :number_carriage, :number, :type, :speed, :station, :is_move, :route

  def initialize(number, type, number_carriage)
    unless validate_type?(type) && validate_number?(number)
      puts 'Неверные данные'
      return
    end

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
    if !validate_spped?
      @number_carriage += count
    else
      puts 'Поезд движется'
      @number_carriage
    end
  end

  def detach_carriage(count = 1)
    if !validate_spped?
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
    @station = get_next_station if get_next_station
  end

  def go_back
    @station = get_previous_station if get_previous_station
  end

  def get_next_station
    if validate_route?
      index = @route.stations.index @station
      length = @route.stations.length
      if index == length
        puts 'вы на последней станции'
      else
        @route.stations[index + 1]
      end
    else
      puts 'Маршрут не задан'
    end
  end

  def get_previous_station
    if validate_route?
      index = @route.stations.index @station
      if index == 0
        puts 'Вы на первой станции'
      else
        @route.stations[index - 1]
      end
    else
      puts 'Маршрут не задан'
    end
  end

  private

  def validate_spped?
    @speed > 0
  end

  def validate_type?(type)
    type_list = [:cargo, :passenger]
    type_list.include?(type)
  end

  def validate_number?(number)
    number.is_a? String
  end

  def validate_route?
    @route != nil
  end
end
