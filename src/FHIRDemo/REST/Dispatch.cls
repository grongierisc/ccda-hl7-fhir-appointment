Class FHIRDemo.REST.Dispatch Extends %CSP.REST
{

Parameter BsName = "WS_REST";

Parameter CHARSET = "UTF-8";

Parameter CONVERTINPUTSTREAM = 1;

Parameter HandleCorsRequest = 1;

XData UrlMap [ XMLNamespace = "http://www.fhirhl7v2demo.com/urlmap" ]
{
<Routes>
  <Route Url="/hl7" Method="POST" Call="hl7" Cors="true"/>
  <Route Url="/custom" Method="POST" Call="custom" Cors="true"/>
  <Route Url="/ccda" Method="POST" Call="ccda" Cors="true"/>
  <Route Url="/clean" Method="POST" Call="clean" Cors="true"/>
</Routes>
}

ClassMethod hl7() As %Status
{
    
    Set content = $zcvt(%request.Content.Read(),"I","UTF8")
    set status = $$$OK
    set tMsg = ##class(EnsLib.HL7.Message).ImportFromString(content)
    
    try {
        $$$ThrowOnError(##class(Ens.Director).CreateBusinessService(..#BsName,.tService))
        
        $$$ThrowOnError(tService.ProcessInput(tMsg,.output))
    } catch(ex) {
        set status = ex.AsStatus()
    }
    
    Set result={}
    do result.%Set("Status",$s($$$ISERR(status):$system.Status.GetOneErrorText(status),1:"OK"))
    Set %response.ContentType = ..#CONTENTTYPEJSON
    write result.%ToJSON()
    return $$$OK
}

ClassMethod ccda() As %Status
{
    set status = $$$OK

    Set tStream = ##class(%GlobalBinaryStream).%New() 

    #; set tContent = %request.Content
    #; Do tContent.Rewind()    
    #; while 'tContent.AtEnd {
    #;     set temp=tContent.ReadLine()
    #;     //set temp=$zcvt(temp,"O","UTF8")
    #;     //set temp=$translate(temp, $c(13,10))
    #;     //set temp=$REPLACE(temp, "\r\n","")
    #;     do tStream.WriteLine(temp)
    #; }

    Set tStream = %request.Content

    set tMsg = ##class(Ens.StreamContainer).%New(tStream)
    
    try {

        $$$ThrowOnError(##class(Ens.Director).CreateBusinessService(..#BsName,.tService))
        
        $$$ThrowOnError(tService.ProcessInput(tMsg,.output))

    } catch(ex) {
        set status = ex.AsStatus()
    }
    
    Set result={}

    do result.%Set("Status",$s($$$ISERR(status):$system.Status.GetOneErrorText(status),1:"OK"))

    Set %response.ContentType = ..#CONTENTTYPEJSON

    write result.%ToJSON()
    return $$$OK
}

ClassMethod custom() As %Status
{
    set status = $$$OK
    set tMsg = ##class(FHIRDemo.Msg.AppointmentRequest).%New()
    
    try {

        $$$ThrowOnError(tMsg.%JSONImport(%request.Content))

        $$$ThrowOnError(##class(Ens.Director).CreateBusinessService(..#BsName,.tService))
        
        $$$ThrowOnError(tService.ProcessInput(tMsg,.output))
    } catch(ex) {
        set status = ex.AsStatus()
    }
    
    Set result={}
    do result.%Set("Status",$s($$$ISERR(status):$system.Status.GetOneErrorText(status),1:"OK"))
    Set %response.ContentType = ..#CONTENTTYPEJSON
    write result.%ToJSON()
    return $$$OK
}

ClassMethod clean() As %Status
{
    set status = $$$OK

    kill ^HSFHIR.I0001.R.RsrcD 	
	kill ^HSFHIR.I0001.R.RsrcI 	
	kill ^HSFHIR.I0001.S.AppointmentD 	
  	kill ^HSFHIR.I0001.S.AppointmentI 	
	kill ^HSFHIR.I0001.S.ConditionD 
    kill ^HSFHIR.I0001.S.ConditionI 
    kill ^HSFHIR.I0001.S.EncounterD 
    kill ^HSFHIR.I0001.S.EncounterI 
    kill ^HSFHIR.I0001.S.ObservationD 
    kill ^HSFHIR.I0001.S.ObservationI 
    kill ^HSFHIR.I0001.S.OrganizationD 
   	kill ^HSFHIR.I0001.S.OrganizationI 	
 	kill ^HSFHIR.I0001.S.PatientD 
	kill ^HSFHIR.I0001.S.PatientI 	
    kill ^HSFHIR.I0001.S.PractitionerD 
    kill ^HSFHIR.I0001.S.PractitionerI 
    kill ^HSFHIR.I0001.S.ProcedureD 
    kill ^HSFHIR.I0001.S.ProcedureI 
    kill ^HSFHIR.I0001.S.RsrcD 	
    kill ^HSFHIR.I0001.S.RsrcI 
    kill ^HSFHIR.I0001.S.ServiceRequestD 	
    kill ^HSFHIR.I0001.S.ServiceRequestI 
    kill ^HSFHIR.I00017C00.valueQuantityD 
    kill ^HSFHIR.I00017C00.valueQuantityI 
    kill ^HSFHIR.I007C00.comboValueQ204ED 
    kill ^HSFHIR.I007C00.comboValueQ204EI
    kill ^HSFHIR.I0001.S.ImmunizationD 
    kill ^HSFHIR.I0001.S.ImmunizationI 
    kill ^HSFHIR.I0001.S.MedicationD 
    kill ^HSFHIR.I0001.S.MedicationI 
    kill ^HSFHIR.I0023D1.DiagnosticR9BA8D 
    kill ^HSFHIR.I0023D1.DiagnosticR9BA8I 
    kill ^HSFHIR.I0023D1.MedicationS448BD 
    kill ^HSFHIR.I0023D1.MedicationS448BI

    
    Set %response.ContentType = ..#CONTENTTYPEJSON

    return $$$OK
}

ClassMethod GetJSONFromRequest(ByRef obj As %DynamicObject) As %Boolean
{
  Set ok = 1
	Try {
		Set obj = ##class(%DynamicObject).%FromJSON(%request.Content)
	} Catch ex {
		Set ok = 0
	}
	Quit ok
}

}
