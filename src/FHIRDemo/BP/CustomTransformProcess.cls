/// This is a custom business process that transforms an HL7 message to SDA format (an internal healthcare data format for InterSystems IRIS for Health).
/// To use this class, add a business process with this class to the production and configure the target. The default target will send the SDA to a component
/// that converts the data to FHIR.
/// 
Class FHIRDemo.CustomTransformProcess Extends Ens.BusinessProcess [ ClassType = persistent ]
{

Parameter SETTINGS = "TargetConfigName:Basic:selector?context={Ens.ContextSearch/ProductionItems?targets=1&productionName=@productionId},TransformFile:Basic";

Property TargetConfigName As Ens.DataType.ConfigName [ InitialExpression = "HS.FHIR.DTL.Util.HC.SDA3.FHIR.Process" ];

/// Transforms an HL7 message to SDA, an internal healthcare format for InterSystems IRIS for Health.
Method OnRequest(pRequest As FHIRDemo.Msg.AppointmentRequest, Output pResponse As Ens.Response) As %Status
{
	set tSC = $$$OK
	try {
         set tSC = ##class(FHIRDemo.DTL.ToSDA.Main).Transform(pRequest,.tSDA)
		 do tSDA.ToQuickXMLStream(.stream)
         set tSC = ..SendRequestSync(..TargetConfigName,##class(Ens.StreamContainer).%New(stream),.pResponse)
	} catch ex {
		set tSC = ex.AsStatus()
	}
	quit tSC
}

Storage Default
{
<Data name="CustomTransformProcessDefaultData">
<Subscript>"CustomTransformProcess"</Subscript>
<Value name="1">
<Value>TargetConfigName</Value>
</Value>
</Data>
<DefaultData>CustomTransformProcessDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
