(:
xquery version "1.0-ml";
let $stems := ("run", "runner", "runs","ran")
return cts:stem($stems)

(:Test query speed:)
declare namespace ts="http://marklogic.com/MLU/top-songs";
fn:count(cts:search(fn:doc(),
cts:element-word-query(xs:QName("ts:title"), "love"))), xdmp:elapsed-time()

(:Test case sensitive search:)
xdmp:estimate(cts:search(fn:doc(), "love")), 
xdmp:estimate(cts:search(fn:doc(), "Love")), 
xdmp:estimate(cts:search(fn:doc(), "LOVE"))c
fn:count(cts:search(fn:doc(), "love")), 
fn:count(cts:search(fn:doc(), "Love")), 
fn:count(cts:search(fn:doc(), "LOVE"))

:)
import module namespace search = "http://marklogic.com/appservices/search" 
	at "/MarkLogic/appservices/search/search.xqy";
declare variable $options-genre :=
	<options xmlns="http://marklogic.com/appservices/search">
		<return-results>false</return-results> 
		<return-facets>true</return-facets> 
		<constraint name="genre">
			<range type="xs:string" collation="http://marklogic.com/collation/" facet="true"> 
				<element ns="http://marklogic.com/MLU/top-songs" name="genre"/> 
			<facet-option>ascending</facet-option>
			</range> 
		</constraint> 
	</options>;
for $results in search:search("", $options-genre)//search:facet-value
return $results








