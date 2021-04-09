class Station
  attr_accessor :trains
  attr_reader :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def arrival_train(train)
    @trains << train
  end

  def depart_train(train)
    @trains.filter {|i| i.number != train.number}
  end

  def get_trains_by_type
    list = {cargo: 0, passenger: 0}
    @trains.each do |i|
      list[i.type] = list[i.type] + 1
    end
    list
  end
end
