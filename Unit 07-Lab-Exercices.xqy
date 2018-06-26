(:

xquery version "1.0-ml";
declare namespace wl = "http://marklogic.com/mlu/world-leaders";
let $incount := fn:count(/wl:leader/wl:positions/ wl:position[1]/wl:enddate/text()[. = "present"])
return fn:concat(" (in office: ", $incount, ")")

:)

declare function local:countwins($team as xs:string+) as xs:integer {
let $seq := //winner[. = $team]
return fn:count($seq)
};
local:countwins("Brazil")
(:local:countwins(("Argentina","Brazil")):)
