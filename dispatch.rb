require_relative './train.rb'
require_relative './route.rb'
require_relative './station.rb'

volgograd = Station.new(:volgograd)
voronesh = Station.new(:voronesh)
astrakhan = Station.new(:astrakhan)
novgorod = Station.new(:novgorod)
saint_petersburg = Station.new(:saint_petersburg)

moscow_astrakhan = Route.new(:moscow, :astrakhan)
moscow_astrakhan.add_station volgograd

sapsan = Train.new('1', :passenger, 8)
sapsan.route moscow_astrakhan
sapsan.accelerate
sapsan.accelerate
sapsan.speed
sapsan.slow_down
sapsan.slow_down
sapsan.number_carriage
sapsan.attach_carriage
sapsan.detach_carriage
sapsan.detach_carriage

lastochka = Train.new('2', :passenger, 12)
express = Train.new('3', :passenger, 6)
cargo1 = Train.new('4', :cargo, 4)
cargo2 = Train.new('5', :cargo, 6)

moscow = Station.new('moscow')
moscow.arrival_train sapsan
moscow.arrival_train express
moscow.arrival_train cargo1
p moscow.arrival_train cargo2
p moscow.depart_train sapsan
#moscow.depart_train express
p moscow.get_trains_by_type
#p moscow.trains


# moscow_astrakhan.add_station :novgorod
# moscow_astrakhan.add_station :voronesh
# moscow_astrakhan.remove_station :novgorod
# # p moscow_astrakhan.get_stations_list
#
moscow_saint_petersburg = Route.new(:moscow, :saint_petersburg)
# moscow_saint_petersburg.add_station :novgorod
#
# sapsan.route moscow_astrakhan
# sapsan.go_ahead
# sapsan.route moscow_saint_petersburg
# sapsan.go_ahead
# sapsan.go_ahead
# sapsan.go_ahead
# sapsan.go_ahead
# sapsan.go_back
#
# sapsan.next_station
# sapsan.get_previous_station
# sapsan.station
