(:
let $location := cts:point(25.788969,-80.226439) (: downtown Miami, Florida :)
return 
  cts:search(
    fn:doc(),
    cts:element-pair-geospatial-query(
      xs:QName("Place"),
      xs:QName("Lat"),
      xs:QName("Lon"),
      cts:circle(200, $location)
    )
  )

(:
  Modify this search to include a full text component as well as the geospatial component.
  
  Find all documents that are:
  Within a 200 mile radius of Miami, Florida 
  AND 
  Mention the word "shark", case insensitive, somewhere in the document.  
:)

let $location := cts:point(25.788969,-80.226439) (: downtown Miami, Florida :)

let $results :=
  cts:search(
    fn:doc(),
    cts:and-query((
      cts:word-query(
        "shark", 
        "case-insensitive"
      ),
      cts:element-pair-geospatial-query(
        xs:QName("Place"),
        xs:QName("Lat"),
        xs:QName("Lon"),
        cts:circle(200, $location)
      )
    ))
  )

for $dive in $results/Dive
let $country := $dive//Country/text()
let $city := $dive//City/text()
let $site := $dive//Site/text()
let $depth := $dive//Depth/text()
let $lat := $dive//Lat/text()
let $lon := $dive//Lon/text()
let $marinelife := $dive//MarineLife
return
  <match-summary>
    <country>{$country}</country>
    <city>{$city}</city>
    <site>{$site}</site>
    <depth>{$depth}</depth>
    <latitude>{$lat}</latitude>
    <longitude>{$lon}</longitude>
    <marine-life>
      {
        for $animal in $marinelife//Animal/Type
        return <animal>{$animal/text()}</animal>
      }      
    </marine-life>
  </match-summary>
    
:)

declare function local:get-coordinates($location){
	let $request := fn:concat("http://maps.googleapis.com/maps/api/geocode/xml?address=", $location)
	let $response := xdmp:http-get($request)
	let $lat := $response[2]/GeocodeResponse/result[1]/geometry/location/lat
	let $lng := $response[2]/GeocodeResponse/result[1]/geometry/location/lng
	return 
		($lat, $lng)
};







