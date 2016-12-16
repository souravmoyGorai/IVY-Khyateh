<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <rules>
        <fullName>Distributor Code</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Account.ParentId</field>
            <operation>contains</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>DistributorCode</fullName>
        <active>false</active>
        <criteriaItems>
            <field>User.ContactId</field>
            <operation>notContain</operation>
            <value>z</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
