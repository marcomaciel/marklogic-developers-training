(:
fn:doc("/book.xml")

xdmp:document-insert("/wcresult1.xml", 
	<wcresult>
		<id>1</id>
		<year>1930</year>
		<location>Uruguay</location>
		<region>South America</region> 
		<winner>Uruguay</winner> 
		<runnerup>Argentina</runnerup> 
		<third>USA</third> 
		<fourth>Yugoslavia</fourth>
	</wcresult> )

xdmp:document-delete("wcresult1.xml")

xdmp:document-load("\wcresult3.xml", 
			<options xmlns="xdmp:document-load">
				<uri>wcresult3.xml</uri> 
				<permissions>{xdmp:default-permissions()}</permissions> 
				<collections>
					<collection>sports</collection>
					<collection>soccer</collection> 
				</collections> 
				<format>xml</format>
			</options>)

xdmp:filesystem-directory("/home/cent/Desktop/mls-developer/unit10/top-songs-source/songs")

fn:doc("/home/cent/Desktop/mls-developer/unit10/top-songs-source/songs/Paper-Lace+The-Night-Chicago-Died.xml")
:)

xquery version "1.0-ml";
declare namespace dir="http://marklogic.com/xdmp/directory";
for $d in xdmp:filesystem-directory("/home/cent/Desktop/mls-developer/unit10/top-songs-source/songs")//dir:entry
return $d//dir:filename/text()








