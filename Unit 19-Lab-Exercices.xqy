(:
xquery version "1.0-ml";
try
{ 
	let $var := 8
	return $var div 0 
} 
catch($err)
{ 
	$err
}

:)

xquery version "1.0-ml";
try
{ 
	let $var := 8
	return $var div 0 
} 
catch($err)
{ 
	xdmp:log("Division by zero error caught", "error") 
}