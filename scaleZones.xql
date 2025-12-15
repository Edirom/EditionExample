xquery version "3.0";

declare default element namespace "http://www.music-encoding.org/ns/mei";

declare option saxon:output "method=xml";
declare option saxon:output "media-type=text/xml";
declare option saxon:output "omit-xml-declaration=yes";
declare option saxon:output "indent=yes";
declare option saxon:output "saxon:indent-spaces=4";

let $editionsContentsBasePath := 'content/sources/'
let $sourceID := 'edirom_source_2b2b26e5-c85d-4edd-8806-fe126ce390a2'

let $sourceDoc := doc(concat($editionsContentsBasePath, $sourceID, '.xml'))

let $heightNew := 1251
let $widthNew := 1000

let $surfaces := $sourceDoc//surface[.//zone]

for $surface at $pos in $surfaces
    let $heightOld := $surface/graphic/@height
    let $widthOld := $surface/graphic/@width

    let $scaleFactorHeight :=  1.7 (:$heightNew div $heightOld:)
    let $scaleFactorWidth := 1.55 (:$widthNew div $heightOld:)

    let $zones := $surface//zone
    for $zone at $n in $zones
        let $ulx := $zone/@ulx
        let $uly := $zone/@uly
        let $lrx := $zone/@lrx
        let $lry := $zone/@lry
        let $ulxNew := round($ulx * $scaleFactorWidth)
        let $ulyNew := round($uly * $scaleFactorHeight)
        let $lrxNew := round($lrx * $scaleFactorWidth)
        let $lryNew := round($lry * $scaleFactorHeight)
        return
            (
             replace value of node $ulx with $ulxNew,
             replace value of node $uly with $ulyNew,
             replace value of node $lrx with $lrxNew,
             replace value of node $lry with $lryNew
            )
