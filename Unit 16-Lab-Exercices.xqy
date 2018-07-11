(:

(: create some sample docs :)
if (xdmp:database-name(xdmp:database()) = "Documents") 
then
  (
  xdmp:document-insert("/testA.xml", <doc><node>hello</node></doc>),
  xdmp:document-insert("/testB.xml", <doc><node>goodbye</node></doc>)
  )
else
  "please select the documents database"

xquery version "1.0-ml";
if (xdmp:database-name(xdmp:database()) = "Documents") 
then
  (
  for $doc in /doc
  return 
    xdmp:node-replace($doc/node, <node>123</node>)
  )
else
  "please select the documents database"

xdmp:document-insert("song1.xml", 
<top-song>
	<title>Money for Nothing</title> 
	<artist>Dire Straits</artist> 
	<weeks>
		<week>1985-09-21</week> <week>1985-09-28</week> <week>1985-10-05</week>
	</weeks>
	<album>Brothers in Arms</album> 
</top-song>)

xdmp:node-replace(fn:doc("song1.xml")/top-song/title, 
	<title>Trouble for Nothing</title>)


xdmp:node-replace(fn:doc("song1.xml")/top-song/title, 
	<title>Trouble for Nothing</title>)

fn:doc("/songs/Jay-Z-and-Alicia-Keys+Empire-State-of-Mind.xml")
declare namespace ts="http://marklogic.com/MLU/top-songs";
xdmp:node-insert-child(
			fn:doc("/songs/Jay-Z-and-Alicia-Keys+Empire-State-of-Mind.xml")//ts:genres, 
				<ts:genre>rap</ts:genre>)

declare namespace ts="http://marklogic.com/MLU/top-songs";
xdmp:node-insert-before(
	fn:doc("/songs/Jay-Z-and-Alicia-Keys+Empire-State-of-Mind.xml")//ts:genres/ts:genre[. eq "Hip hop"], 
		<ts:genre>pop</ts:genre>)

(: create a document :)
xdmp:document-insert("/example.xml",
    <a/>);

(: insert a child of a :)
xdmp:node-insert-child(doc("/example.xml")/a,
    <b>bbb</b>);

(: insert an attribute as child of a :)
  xdmp:node-insert-child(doc("/example.xml")/a,
    attribute b { "bbb" });

(: look at the new document :)
fn:doc("/example.xml") 

declare namespace ts="http://marklogic.com/MLU/top-songs";
fn:(fn:doc("/songs/Stevie-Wonder+I-Just-Called-to-Say-I-Love-You.xml")//ts:weeks/ts:week)

declare namespace ts="http://marklogic.com/MLU/top-songs";
let $weeks := fn:doc("/songs/Stevie-Wonder+I-Just-Called-to-Say-I-Love-You.xml")//ts:weeks
let $count := fn:count($weeks/ts:week)
return xdmp:node-insert-child($weeks, attribute count {$count})

declare namespace ts="http://marklogic.com/MLU/top-songs";
for $weeks in  //ts:weeks
let $count := fn:count($weeks/ts:week)
return 
if($weeks/@count)
then xdmp:node-replace($weeks/@count, attribute count {$count})
else xdmp:node-insert-child($weeks, attribute count {$count})
:)

declare namespace ts="http://marklogic.com/MLU/top-songs";
doc("/songs/Stevie-Wonder+I-Just-Called-to-Say-I-Love-You.xml")//ts:weeks







