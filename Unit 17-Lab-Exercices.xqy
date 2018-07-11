(:
for $doc in fn:doc()
let $base-uri := fn:base-uri($doc)
let $perms := 
  (xdmp:permission("top-songs-user-role", "read"),
   xdmp:permission("top-songs-admin-role", "update"))
return xdmp:document-set-permissions($base-uri, $perms)

:)
for $doc in fn:doc()[1 to 10]
let $uri := fn:base-uri($doc)
return ($uri, xdmp:document-get-permissions($uri))


