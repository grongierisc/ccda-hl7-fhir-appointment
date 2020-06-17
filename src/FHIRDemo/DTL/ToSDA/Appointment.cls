Class FHIRDemo.DTL.ToSDA.Appointment Extends Ens.DataTransformDTL [ DependsOn = (FHIRDemo.Msg.AppointmentRequest, HS.SDA3.Appointment) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='FHIRDemo.Msg.AppointmentRequest' targetClass='HS.SDA3.Appointment' create='new' language='objectscript' >
<assign value='##class(HS.FHIR.DTL.Utils).NormalizeTimeStamp(source.Appointment.EndDate)' property='target.FromTime' action='set' />
<assign value='source.Patient.Number' property='target.ExternalId' action='set' />
<assign value='source.Encounter.EncounterNumber' property='target.EncounterNumber' action='set' />
<assign value='##class(HS.FHIR.DTL.Utils).NormalizeTimeStamp(source.Appointment.StartDate)' property='target.ToTime' action='set' />
<assign value='"From Renez-Vous"' property='target.Notes' action='set' />
<assign value='source.Appointment.Status' property='target.Status' action='set' />
<assign value='source.Encounter.ClinicianLastName' property='target.CareProvider.Name.FamilyName' action='set' />
<assign value='source.Encounter.ClinicianFirstName' property='target.CareProvider.Name.GivenName' action='set' />
</transform>
}

}
