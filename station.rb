class Station
  attr_accessor :trains, :can_arrival, :can_departure
  attr_reader :name

  def initialize(name)
    @name = name
    @trains = []
    @can_arrival = true
    @can_departure = true
  end

  def arrival_train(train)
    if @can_arrival
      @trains << train if @can_arrival
      @can_arrival = false
      @trains
    else
      puts "Другой поезд прибыл на станцию, ожидайте разрешения"
    end
  end

  def depart_train(train)
    if @can_departure
    has = false
    @trains.each do |i|
      has = true if i.number == train.number
    end
      if has
        @can_departure = false
        @trains.delete(train)
        @trains
      else
        puts "Такого поезда нет"
      end
    else
      puts "Другой поезд отправляется, ожидайте разрешения"
    end
  end

  def get_trains_by_type
    list = {cargo: 0, passenger: 0}
    @trains.each do |i|
      list[i.type] = list[i.type] + 1
    end
    list
  end
end
