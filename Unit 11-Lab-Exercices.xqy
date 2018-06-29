(:

declare namespace ts="http://marklogic.com/MLU/top-songs";
for $song in cts:search(fn:doc(), "night") [1 to 25] 
return $song/ts:top-song/ts:title/string()

declare namespace ts="http://marklogic.com/MLU/top-songs";
for $songtitle in cts:search(fn:doc()/ts:top-song/ts:title, "night")[1 to 10] 
return <div>{$songtitle/text()}</div>

declare namespace ts="http://marklogic.com/MLU/top-songs";
for $song in /ts:top-song[fn:contains(., "night")][1 to 10]
return $song

declare namespace ts="http://marklogic.com/MLU/top-songs";
for $song in cts:search(fn:doc(), "night")[1 to 20] 
order by $song//ts:title/text()
return fn:distinct-values($song//ts:title/text())

declare namespace ts="http://marklogic.com/MLU/top-songs";
declare function local:build-query($text as xs:string) { 
  cts:word-query($text) 
};
for $song in cts:search(fn:doc(), local:build-query("night"))[1 to 10] 
return <div>{$song/ts:top-song/ts:title/text()}</div>

declare namespace ts="http://marklogic.com/MLU/top-songs";
declare function local:build-query($text as xs:string)
{ 
  cts:or-query((
                cts:word-query($text, (), 1), 
                cts:element-word-query(xs:QName("ts:title"), $text, (), 2)
              ))
};
for $song in cts:search(fn:doc(), local:build-query("night"))[1 to 15] 
return <div>{$song/ts:top-song/ts:title/text()} scroe:[{cts:score($song)}] confidence[{cts:confidence($song)}]</div>

import module namespace search = "http://marklogic.com/appservices/search" at "/MarkLogic/appservices/search/search.xqy";
let $options :=
<options xmlns="http://marklogic.com/appservices/search">
<transform-results apply="raw" /> </options>
return search:search("italy", $options)

declare namespace ts="http://marklogic.com/MLU/top-songs";
import module namespace search = "http://marklogic.com/appservices/search" 
	at "/MarkLogic/appservices/search/search.xqy";
search:search("night")

declare namespace ts="http://marklogic.com/MLU/top-songs";
import module namespace search = "http://marklogic.com/appservices/search" 
	at "/MarkLogic/appservices/search/search.xqy";
let $options := <options xmlns="http://marklogic.com/appservices/search">
					<transform-results apply="raw"/> 
				</options>
return search:search("night", $options)

declare namespace ts="http://marklogic.com/MLU/top-songs";
import module namespace search = "http://marklogic.com/appservices/search" 
	at "/MarkLogic/appservices/search/search.xqy";
let $options := <options xmlns="http://marklogic.com/appservices/search">
					<transform-results apply="raw"/> 
				</options>
for $song in search:search("night", $options)/search:result 
	return <div>{$song//ts:title/text()}</div>

declare namespace ts="http://marklogic.com/MLU/top-songs";
import module namespace search = "http://marklogic.com/appservices/search" 
	at "/MarkLogic/appservices/search/search.xqy";
for $song in search:search("night")/search:result 
let $title := fn:doc($song/@uri)//ts:title/text() 
return <div>{$title}</div>
:)

declare namespace ts="http://marklogic.com/MLU/top-songs";
import module namespace search = "http://marklogic.com/appservices/search" 
	at "/MarkLogic/appservices/search/search.xqy";
for $song in search:search("night")/search:result 
let $title := fn:doc($song/@uri)//ts:title/text() 
return <div>{$title}</div>
















