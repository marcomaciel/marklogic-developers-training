
declare namespace ts="http://marklogic.com/MLU/top-songs";
import module namespace search = "http://marklogic.com/appservices/search" at "/MarkLogic/appservices/search/search.xqy";
declare variable $options := 
<options xmlns="http://marklogic.com/appservices/search">
  <constraint name="artist">
    <range type="xs:string" collation="http://marklogic.com/collation/en/S1/AS/T00BB">
     <element ns="http://marklogic.com/MLU/top-songs" name="artist"/>
     <facet-option>limit=30</facet-option>
     <facet-option>frequency-order</facet-option>
     <facet-option>descending</facet-option>
    </range>
  </constraint> 
  <constraint name="decade">
    <range type="xs:date">
      <bucket ge="2010-01-01" name="2010s">2010s</bucket>
      <bucket lt="2010-01-01" ge="2000-01-01" name="2000s">2000s</bucket>
      <bucket lt="2000-01-01" ge="1990-01-01" name="1990s">1990s</bucket>
      <bucket lt="1990-01-01" ge="1980-01-01" name="1980s">1980s</bucket>
      <bucket lt="1980-01-01" ge="1970-01-01" name="1970s">1970s</bucket>
      <bucket lt="1970-01-01" ge="1960-01-01" name="1960s">1960s</bucket>
      <bucket lt="1960-01-01" ge="1950-01-01" name="1950s">1950s</bucket>
      <bucket lt="1950-01-01" name="1940s">1940s</bucket>
      <attribute ns="" name="last"/>
      <element ns="http://marklogic.com/MLU/top-songs" name="weeks"/>
      <facet-option>limit=10</facet-option>
    </range>
  </constraint
  <constraint name="genre">
    <range type="xs:string" collation="http://marklogic.com/collation/en/S1/AS/T00BB">
     <element ns="http://marklogic.com/MLU/top-songs" name="genre"/>
     <facet-option>limit=20</facet-option>
     <facet-option>frequency-order</facet-option>
     <facet-option>descending</facet-option>
    </range>
  </constraint> 
</options>;
let $results := search:search("", $options)
for $facet in $results/search:facet
return $facet




