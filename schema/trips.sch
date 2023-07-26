<?xml version="1.0" encoding="UTF-8"?>
<schema queryBinding="xslt2" xmlns="http://purl.oclc.org/dsdl/schematron"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">

    <let name="trip-ids"
        value="collection('../president-travels?select=*.xml')//id, collection('../secretary-travels?select=*.xml')//id"/>
    <let name="next-id" value="max(($trip-ids ! (. cast as xs:integer))) + 1"/>

    <pattern>
        <rule context="trip">
            <assert test="xs:date(start-date) le xs:date(end-date)">Date problem: End date must come
                on or after the start date.</assert>
        </rule>
    </pattern>

    <pattern>
        <rule context="remarks">
            <assert role="warn" test="normalize-space(.) ne ''">Remarks should not be
                empty.</assert>
            <assert role="warn" test="normalize-space(.) eq '' or matches(., '\p{P}$')">Remarks
                should end with a punctuation character.</assert>
        </rule>
    </pattern>

    <pattern>
        <rule context="id">
            <let name="this-id" value="./string()"/>
            <let name="count-used" value="count($trip-ids[. eq $this-id])"/>
            <assert sqf:fix="update-id" test="$count-used eq 1">Trip ID problem: <value-of
                    select="$count-used - 1"/> other trip(s) also use this ID."/></assert>
            <sqf:fix id="update-id">
                <sqf:description>
                    <sqf:title>Fix ID (use next available ID, <value-of select="$next-id"
                        />)</sqf:title>
                </sqf:description>
                <sqf:replace match="text()" select="$next-id"/>
            </sqf:fix>
        </rule>
    </pattern>

</schema>
