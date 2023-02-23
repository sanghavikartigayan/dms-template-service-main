delete from dmstemplate.template where template_id = '6ffd6a5a-198e-11ed-861d-0242ac120012';

insert into dmstemplate.template (template_id, process_id, template_name, template_type, approved_by, modified_by,
                                  modified_on, template_fields, template_data, is_active, version, created_by,
                                  created_on)
values ('6ffd6a5a-198e-11ed-861d-0242ac120012', 'COMMON', 'Reusable_footer', 'HTML', '', 'dms_template',
        current_timestamp, '[        {
            "fieldName": "footerCode",
            "fieldType": "STRING",
            "defaultValue": "",
            "isRequired": true
        }]',
        '<div id="pageFooter">

    <p class="footerTop">Providing OMERS with your personal information is considered consent for its use and disclosure for the purposes set out in our Privacy Statement, as amended from time to time. You can find out more about our collection, use, disclosure and retention of personal information by reviewing our Privacy Statement at www.omers.com.</p>

    <div class="footerBottom" >
        <#assign footerCode=footerRefCode!"COF"/>
        <span class="footerLeft">OMERS Ref: <#if !footerCode?has_content>COF</#if>${footerCode}</span>

        <span class = "footerCenter">PRIVATE & CONFIDENTIAL</span>
        <div id="pageFooterNumber">
        <span class="footerRight"><span  id="pageNumber"></span> of <span id="pageCount"></span></span>
        </div>
    </div>

</div>', true, 1, 'dms_template', current_timestamp);