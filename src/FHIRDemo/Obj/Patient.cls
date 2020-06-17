Class FHIRDemo.Obj.Patient Extends (%SerialObject, %JSON.Adaptor, %XML.Adaptor)
{

Property Number As %String;

Property NumberType As %String;

Property FirstName As %String;

Property LastName As %String;

Property Gender As %String;

Storage Default
{
<Data name="PatientState">
<Value name="1">
<Value>Number</Value>
</Value>
<Value name="2">
<Value>NumberType</Value>
</Value>
<Value name="3">
<Value>FirstName</Value>
</Value>
<Value name="4">
<Value>LastName</Value>
</Value>
<Value name="5">
<Value>Gender</Value>
</Value>
</Data>
<State>PatientState</State>
<StreamLocation>^FHIRDemo.Obj.PatientS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
