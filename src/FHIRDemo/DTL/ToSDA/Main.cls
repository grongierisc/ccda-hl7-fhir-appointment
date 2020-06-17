Class FHIRDemo.DTL.ToSDA.Main Extends Ens.DataTransformDTL [ DependsOn = (FHIRDemo.Msg.AppointmentRequest, HS.SDA3.Container) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='FHIRDemo.Msg.AppointmentRequest' targetClass='HS.SDA3.Container' create='new' language='objectscript' >
<assign value='source.Patient.LastName' property='target.Patient.Name.FamilyName' action='set' />
<assign value='source.Patient.FirstName' property='target.Patient.Name.GivenName' action='set' />
<assign value='source.Patient.Gender' property='target.Patient.Gender.Code' action='set' />
<assign value='source.Patient.Number' property='target.Patient.ExternalId' action='set' />
<subtransform class='FHIRDemo.DTL.ToSDA.Appointment' targetObj='target.Appointments.(1)' sourceObj='source' />
</transform>
}

}
