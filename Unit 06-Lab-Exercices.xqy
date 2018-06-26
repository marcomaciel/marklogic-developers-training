(:
xquery version "1.0-ml";
let $x := <p>Hello <span class="worldstyle">World</span>!</p> 
return $x/string()

xquery version "1.0-ml";
let $x := <p>Hello <span class="worldstyle">World</span>!</p> 
return fn:string($x)

fn:string() versus fn:data()
Although these functions are often used interchangeably, technically the fn:string() function returns the values as strings, whereas the fn:data() function returns the values as their typed value.
xquery version "1.0-ml";
let $x := <p>Hello <span class="worldstyle">World</span>!</p> 
return fn:data($x)

xquery version "1.0-ml";
let $xml := document {<customer><phone>5551239999</phone></customer>}
let $phone := fn:string($xml/customer/phone/text())
return ("Area code = ", fn:substring($phone, 1, 3))

xquery version "1.0-ml";
let $xml := document {<customer><phone>5551239999</phone></customer>}
let $phone := fn:string($xml/customer/phone/text())
let $formatted_phone := fn:replace($phone, "(\d{3})(\d{3})(\d{4})", "($1) $2-$3") 
return $formatted_phone

xquery version "1.0-ml";
let $xml := document {<customer><phone>5551239999</phone></customer>}
let $phone := fn:string($xml/customer/phone/text())
return fn:tokenize(fn:replace($phone, "(\d{3})(\d{3})(\d{4})", "$1 $2 $3"), " ")

xquery version "1.0-ml";
let $xml := document {<customer><phone>5551239999</phone></customer>}
let $phone := fn:string($xml/customer/phone/text())
return fn:string-join(fn:tokenize(fn:replace($phone, "(\d{3})(\d{3})(\d{4})", "$1 $2 $3"), " "),".")


xquery version "1.0-ml";
let $xml := document {<customer><phone>5551239999</phone></customer>}
let $phone := fn:string($xml/customer/phone/text())
return fn:string-join(fn:tokenize(fn:replace($phone, "(\d{3})(\d{3})(\d{4})", "$1 $2 $3"), " "),".")

xquery version "1.0-ml";
declare namespace bks = "http://www.marklogic.com/bookstore";
/bks:bookstore/bks:book[cts:contains(., "Harry")]

xquery version "1.0-ml";
declare namespace bks = "http://www.marklogic.com/bookstore";
/bks:bookstore/bks:book[cts:contains(., "Harry")]/bks:title/string()

xquery version "1.0-ml";
declare namespace bks = "http://www.marklogic.com/bookstore";
fn:count(/bks:bookstore/bks:book[./bks:price/text() < 30])

fn:count(("Haitao", "Scott", "Dipti", "Alan", "Tamas", "Jason", "Ashutosh"))

let $niver := xs:date("1974-06-30")
let $dif_anos  := xs:integer(fn:days-from-duration(fn:current-date()-$niver) div 365.25)
return $dif_anos

xs:integer(123.989) ==> fn:floor(123.989)

xs:integer(fn:days-from-duration(fn:current-date() - xs:date("2000-10-10")) div 365.25)
:)



fn:distinct-values(/wcresults/wcresult/winner/text())








