module RoutesHelper
    def route_count(route)
        stations=route.stations
        count=0
        stations.each do |station|
            if current_user.stations.find_by(station_id: station.id)!=nil
               count=count+1
            end
       end
       return count
    end
end
