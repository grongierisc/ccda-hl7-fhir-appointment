Class FHIRDemo.Obj.Encounter Extends (%SerialObject, %JSON.Adaptor, %XML.Adaptor)
{

Property EncounterType As %String;

Property EncounterNumber As %String;

Property ClinicianCode As %String;

Property ClinicianLastName As %String;

Property ClinicianFirstName As %String;

Storage Default
{
<Data name="EncounterState">
<Value name="1">
<Value>EncounterType</Value>
</Value>
<Value name="2">
<Value>ClinicianCode</Value>
</Value>
<Value name="3">
<Value>ClinicianLastName</Value>
</Value>
<Value name="4">
<Value>ClinicianFirstName</Value>
</Value>
<Value name="5">
<Value>EncounterNumber</Value>
</Value>
</Data>
<State>EncounterState</State>
<StreamLocation>^FHIRDemo.Obj.EncounterS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
