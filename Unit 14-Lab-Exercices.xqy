(:


import module namespace search = "http://marklogic.com/appservices/search" 
	at "/MarkLogic/appservices/search/search.xqy";
search:search("train")
:)

import module namespace search = "http://marklogic.com/appservices/search" 
	at "/MarkLogic/appservices/search/search.xqy";
declare variable $options :=
	<options xmlns="http://marklogic.com/appservices/search">
		<transform-results apply="snippet"> 
			<preferred-elements>
				<element ns="http://marklogic.com/MLU/top-songs" name="descr"/> 
			</preferred-elements>
	</transform-results> </options>;
search:search("train", $options)








