Class FHIRDemo.Obj.RendezVous Extends %SerialObject
{

Property Patient As Patient;

Property Encounter As Encounter;

Property Appointment As Appointment;

Storage Default
{
<Data name="AppointmentState">
<Value name="1">
<Value>Patient</Value>
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
<Value name="5">
<Value>Encounters</Value>
</Value>
<Value name="6">
<Value>Appointments</Value>
</Value>
<Value name="7">
<Value>Encounter</Value>
</Value>
<Value name="8">
<Value>Appointment</Value>
</Value>
</Data>
<State>AppointmentState</State>
<StreamLocation>^FHIRDemo.Obj.AppointmentS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
