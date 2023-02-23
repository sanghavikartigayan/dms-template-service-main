insert into dmstemplate.template (template_id, process_id, template_name, template_type, approved_by, modified_by,
                                  modified_on, template_fields, template_data, is_active, version, created_by,
                                  created_on)
values ('6ffd6a5a-198e-11ed-861d-0242ac120018', 'PRINT', 'Email_batch_print', 'HTML', '', 'dms_template',
        current_timestamp,
        '[{"defaultValue": "","fieldName": "document_name","fieldType": "STRING","isRequired": true},{"defaultValue": 0,"fieldName": "batch_count","fieldType": "NUMBER","isRequired": false},{"defaultValue": "", "fieldName": "first_print_id","fieldType": "STRING","isRequired": false},{"defaultValue": "","fieldName": "last_print_id","fieldType": "STRING","isRequired": false},{"defaultValue": "","fieldName": "details","fieldType": "ARRAY","isRequired": false}]',
        '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml"
      xmlns:o="urn:schemas-microsoft-com:office:office" lang-="en">
<head>
    <title>Batch Print</title>

    <style>
        .text-generic {margin: 0cm; font-size: 13.5pt; font-family: Arial, sans-serif; color: rgb(1, 58, 112); text-align: left;white-space: pre;}
        .data-details {margin: 0cm; font-size: 13.5pt; font-family: Arial, sans-serif; color: rgb(1, 58, 112); text-align: left;}

    </style>
</head>
<body>
<table style="margin-left:auto;margin-right:auto;">
    <tbody>
    <tr>
        <td style="padding: 0cm;">
            <p class="text-generic">
                Good day,
                <br/>
                There has been a batch print for the NFT Offer Packs that contain:
                <br/>
            </p>
        </td>
    </tr>
    <tr>
        <br/>
    </tr>
    <tr>
        <td style="padding-left: 40px;">
            <p class="text-generic">
                Document Name: ${document_name}<br/>
                Number of documents printed: ${batch_count}<br/>
                First Print ID: ${first_print_id}<br/>
                Last Print ID: ${last_print_id}<br/>
                Generated on: ${.now?string.iso}<br/>
            </p>
        </td>
    </tr>
    <tr>
        <br/>
    </tr>

    <tr>

        <td>
            <p class="data-details">
            Details:
            <br/>
            </p>
        </td>
    </tr>
    <tr>
        <td style="padding-left: 40px;">
            <table>
                 <p class="data-details">
                <#list details as detail>
                <thead>
                    <tr>
                        <th class="data-details">Name</th>
                        <th class="data-details">Value</th>
                    </tr>
                </thead>
                <tbody>
                    <#list detail?keys as key>

                    <tr>
                    <td class="data-details">${key}</td>
                    <td class="data-details">${detail[key]}</td>
                    </tr>
                    </#list>
                </tbody>
                </#list>
                </p>
            </table>

        </td>
    </tr>
    <tr>
        <br/><br/>
    </tr>
    <tr>
        <td style="padding: 0cm;">
            <p class="text-generic">
                Thank you,
                <br/>
                Donna Team
                <br/>
            </p>
        </td>
    </tr>
</tbody>
</table>
</body>
</html>',
        true, 1, 'dms_template', current_timestamp);


--==========================
-- insert into history table
--==========================

insert into dmstemplate.template_history (audit_id,template_id, process_id, template_name, template_type, approved_by, modified_by,
                                          modified_on, template_fields, template_data, is_active, version, created_by,
                                          created_on)
select 'b059f61a-e9ff-4543-b6c8-9c4e63279633', template_id, process_id,template_name,template_type, approved_by, modified_by,
       current_timestamp, template_fields, template_data, is_active, version, created_by,
       current_timestamp
from dmstemplate.template
where template_id ='6ffd6a5a-198e-11ed-861d-0242ac120018'
;

