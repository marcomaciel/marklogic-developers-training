
(:
(: iterate over a sequence returned from an XPath expression :)

xquery version "1.0-ml";

declare namespace bks = "http://www.marklogic.com/bookstore";

for $book in /bks:bookstore/bks:book
return
  $book


for $i in (2, 3, 5, 7) 
	return $i * $i

declare namespace wl = "http://marklogic.com/mlu/world-leaders"; 
for $leader in /wl:leader
return
<td><b>/wl:leader[wl:country eq "Argentina"]/wl:name/wl:firstname/text()</b></td> <td><b>/wl:leader[wl:country eq "Argentina"]/wl:name/wl:lastname/text()</b></td> <td>//wl:country[. eq "Argentina"]/text()</td>

<table><tr><th>year</th><th>winner</th><th>runnerup</th></tr>
{
for $i in //wcresult
let $year := $i/year/text()
let $winner := $i/winner/text()
let $runnerup := $i/runnerup/text()
return <tr><td>{$year}</td><td>{$winner}</td><td>{$runnerup}</td></tr> }
</table>


declare namespace wl = "http://marklogic.com/mlu/world-leaders"; 
for $leader in /wl:leader
let $firstname := $leader/wl:name/wl:firstname/text()
return $firstname


<table>
<tr><th>year</th><th>winner</th><th>country population</th></tr>
{
for $wcresult in //wcresult
for $country in /country
let $year := $wcresult/year/text()
let $winner := $wcresult/winner/text()
let $population := $country/population/text()
where $wcresult/winner eq $country/name
return <tr><td>{$year}</td><td>{$winner}</td><td>{$population}</td></tr> }
</table>

for $i in //wcresult
 where $i/year > 1970 and $i/winner = "Italy"
  return $i

for $i in //wcresult 
return <div>
	<h1>World Cup {$i/year/text()}</h1>	
	<p>winner: {$i/winner/text()}<br/>
	runnerup: {$i/runnerup/text()}</p> 
	</div>

for $i in //wcresult
return ($i/year/text(), $i/winner/text(), $i/runnerup/text())

:)
for $i in //wcresult
return (<h1>World Cup {$i/year/text()}</h1>,
		<p>winner: {$i/winner/text()}<br/> 
		runnerup: {$i/runnerup/text()}</p>)




