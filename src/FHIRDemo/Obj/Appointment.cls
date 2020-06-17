Class FHIRDemo.Obj.Appointment Extends (%SerialObject, %JSON.Adaptor, %XML.Adaptor)
{

Property StartDate As %String;

Property EndDate As %String;

Property Status As %String;

Storage Default
{
<Data name="AppointmentState">
<Value name="1">
<Value>EncounterNumber</Value>
</Value>
<Value name="2">
<Value>StartDate</Value>
</Value>
<Value name="3">
<Value>EndDate</Value>
</Value>
<Value name="4">
<Value>Status</Value>
</Value>
</Data>
<State>AppointmentState</State>
<StreamLocation>^FHIRDemo.Obj.AppointmentS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
