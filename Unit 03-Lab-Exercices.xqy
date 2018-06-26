
fn:doc("worldcupresults.xml")
fn:doc("worldcupresults.xml")/wcresults/wcresult/location/text()
fn:doc("worldcupresults.xml")/wcresults/wcresult
fn:doc("United_Kingdom_David_Cameron.xml")

(: Namespace :)
declare namespace wl = "http://marklogic.com/mlu/world-leaders"; 
fn:doc("United_Kingdom_David_Cameron.xml")/wl:leader/wl:name/wl:firstname/text()

declare namespace wl = "http://marklogic.com/mlu/world-leaders";
/wl:leader/wl:name/wl:firstname/text()

(: Predicates :)
declare namespace wl = "http://marklogic.com/mlu/world-leaders"; 
/wl:leader[wl:gender eq "female"]/wl:name

declare namespace wl = "http://marklogic.com/mlu/world-leaders"; 
/wl:leader[wl:dob < "1950-01-01"][wl:gender eq "female"]/wl:name

(: Axes :)
/wcresults/descendant::year/text()
//year/following-sibling::*

(: Referencing Attributes :)
/wcresults/wcresult[@id eq "18"]/winner/text()
/wcresults/wcresult[attribute::id eq "19"]/winner/text()
/wcresults/wcresult/@id
/wcresults/wcresult[location eq "South Africa"]/@id

(: Sereializarion of Attributes :)
xquery version "1.0-ml";

declare namespace mv = "movies";

//mv:description/string()

fn:string(/wcresults/wcresult[location eq "South Africa"]/@id);
declare namespace wl = "http://marklogic.com/mlu/world-leaders"; 
<td>{fn:string(/wl:leader[wl:country eq "Argentina"]/wl:positions/wl:position[1]/@hos)}</td>

//winner/text()

//year[. >= 2006]/text()


//year[. >= 2006]/text()









