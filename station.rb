class Station
  attr_accessor :trains
  attr_reader :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def arrival_train(train)
    @trains << train
    train.slow_down
    train.slow_down
    train.slow_down 100
  end

  def depart_train(train)
    @trains.filter! {|i| i.number != train.number}
    train.next_station
    train.accelerate
    train.accelerate
  end

  def get_trains_by_type
   list = {
        cargo: (@trains.filter {|i| i.type == :cargo}).count ,
        passenger: (@trains.filter {|i| i.type == :passenger}).count,
    }
  end
end
