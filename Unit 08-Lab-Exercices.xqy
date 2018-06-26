(:

xquery version "1.0-ml";
declare namespace wl = "http://marklogic.com/mlu/world-leaders";
let $incount := fn:count(/wl:leader/wl:positions/ wl:position[1]/wl:enddate/text()[. = "present"])
return fn:concat(" (in office: ", $incount, ")")

:)

xquery version "1.0-ml";

module namespace co = "http://marklogic.com/mlu/world- leaders/common";

declare function local:in-office() as xs:string
{ 
	let $inseq := for $present in /wl:leader/wl:positions/wl:position[1]/wl:enddate/text()[. = "present"] 
	return 
		$present

	let $incount := fn:count($inseq)
	return 
		fn:concat(" (in office: ", $incount, ")")
};


