# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#        
#routeNameList=[]
#routeActiveList=[]#true or false
#routeNumberList=[]
#
#stationNameList=[]
#stationActiveList=[]#true or false
#stationPrefectureIdList=[]#0~46


#modelname=RsRelationship
#rsRelationshipRouteIdList=[]#number
#rsRelationshipStationIdList=[]#number


####for development ###
#Route.create(name: "ルートA",number: 2)
#Route.create(name: "ルートH",number: 1,active: false)
#Station.create(name: "現行駅",prefecture_id: 1)
#Station.create(name: "廃駅",prefecture_id: 1,active: false)

#RsRelationship.create(station_id: 1,route_id: 1)
#RsRelationship.create(station_id: 1,route_id: 2)
#RsRelationship.create(station_id: 2,route_id: 1)

require 'json'
require 'csv'

prefectureNameList=["都道府県名","北海道","青森県","岩手県","宮城県","秋田県","山形県","福島県","茨城県","栃木県","群馬県","埼玉県","千葉県","東京都","神奈川県","新潟県","富山県","石川県","福井県","山梨県","長野県","岐阜県","静岡県","愛知県","三重県","滋賀県","京都府","大阪府","兵庫県","奈良県","和歌山県","鳥取県","島根県","岡山県","広島県","山口県","徳島県","香川県","愛媛県","高知県","福岡県","佐賀県","長崎県","熊本県","大分県","宮崎県","鹿児島県","沖縄県"]
#prefectureNumberList=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47]
47.times do |n|
    Prefecture.create!(name: prefectureNameList[n+1])
end

pr=""
File.open("./db/PR.json") do |f|
    pr=JSON.load(f)
end

rs=""
File.open("./db/RS.json") do |f|
    rs=JSON.load(f)
end

sta=""
File.open("./db/Sta.json") do |f|
    begin
        sta=JSON.load(f)
    rescue => error
        p error
    end
end


rs.each do |f|
    if Route.find_by(route_cord: f["line_cd"])==nil
        Route.create(name: f["line_name"],longitude: f["line_lon"], latitude: f["line_lat"],route_cord: f["line_cd"])
    end
end
   
prefectureID=0 
pr.each do |f|
    prefectureID=prefectureID+1
    f["line"].each do |s|
        begin
            route=Route.find_by(route_cord: s["line_cd"])
            PrRelationship.create(prefecture_id: prefectureID, route_id: route.id)
        rescue
            p s["line_cd"]
            p route
        end
    end
end



sta.each do |f|
    f["station"].each do |s|
        begin
            if Station.find_by(station_cord: s["station_cd"])
              if Station.find_by(station_cord: s["station_cd"]).routes.find_by(route_cord: s["line_cd"])
                   
              else
                   RsRelationship.create(route_id: Route.find_by(route_cord: s["line_cd"]).id, station_id: station.id)
              end
            else
                station=Station.create(prefecture_id: s["pref_cd"],name: s["station_name"], station_cord: s["station_cd"], station_group_cord: s["station_g_cd"], longitude: s["lon"], latitude: s["lat"])
                RsRelationship.create(route_id: Route.find_by(route_cord: s["line_cd"]).id, station_id: station.id)
            end
        rescue => error
            p error
            p s
        end    
    end
end

47.times do |f|
    prefecture=Prefecture.find(f+1)
    prefecture.number=prefecture.stations.count
    prefecture.save
end

Route.count.times do |f|
    route=Route.find(f+1)
    route.number=route.stations.count
    route.save
end