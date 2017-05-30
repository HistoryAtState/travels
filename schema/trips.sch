<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:pattern>
        <sch:rule context="trip">
            <sch:assert test="xs:date(start-date) le xs:date(end-date)">Date problem: End date must come on or after the start date.</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>