insert into dmstemplate.template_history (audit_id,template_id, process_id, template_name, template_type, approved_by, modified_by,
                                  modified_on, template_fields, template_data, is_active, version, created_by,
                                  created_on)
values ('b059f61a-e9ff-4543-b6c8-9c4e63279630','6ffd6a5a-198e-11ed-861d-0242ac120000', 'SAD', 'FLV_CoverLetter_Template', 'HTML', '', 'dms_template',
        current_timestamp, '[
    {
      "defaultValue": "",
      "fieldName": "currentDate",
      "fieldType": "DATE",
      "isRequired": true
    },
    {
      "defaultValue": "",
      "fieldName": "recipientName",
      "fieldType": "STRING",
      "isRequired": true
    },
    {
      "defaultValue": "",
      "fieldName": "memberFirstName",
      "fieldType": "STRING",
      "isRequired": true
    },
    {
      "defaultValue": "",
      "fieldName": "memberLastName",
      "fieldType": "STRING",
      "isRequired": true
    },
    {
      "defaultValue": "",
      "fieldName": "memberNumber",
      "fieldType": "STRING",
      "isRequired": true
    },
    {
      "defaultValue": "",
      "fieldName": "address",
      "fieldType": "STRING",
      "isRequired": true
    },
    {
      "defaultValue": "",
      "fieldName": "address2",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "city",
      "fieldType": "STRING",
      "isRequired": true
    },
    {
      "defaultValue": "",
      "fieldName": "provinceState",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "postalZip",
      "fieldType": "STRING",
      "isRequired": true
    },
    {
      "defaultValue": "",
      "fieldName": "country",
      "fieldType": "STRING",
      "isRequired": true
    },
    {
      "defaultValue": "",
      "fieldName": "applicantType",
      "fieldType": "STRING",
      "isRequired": true
    },
    {
      "defaultValue": "",
      "fieldName": "spouseFirstName",
      "fieldType": "STRING",
      "isRequired": true
    },
    {
      "defaultValue": "",
      "fieldName": "spouseLastName",
      "fieldType": "STRING",
      "isRequired": true
    },
    {
      "defaultValue": "",
      "fieldName": "bussinessName",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "footerRefCode",
      "fieldType": "STRING",
      "isRequired": true
    },
    {
      "defaultValue": false,
      "fieldName": "rcaBenifit",
      "fieldType": "BOOLEAN",
      "isRequired": false
    },
    {
      "defaultValue": false,
      "fieldName": "multipleMembershipAVC",
      "fieldType": "BOOLEAN",
      "isRequired": false
    }
  ]',
        '<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<#include "pensionsHeader.ftl">
<#include "pensionsFooter.ftl">
</head>
    <body>

          <div id="content">
            <p>${currentDate?date?string(''MMMM dd, yyyy'')}</p>

            <p><#if applicantType == ''LFS'' || applicantType == ''LM''>${recipientName}<br/></#if>
				<#if applicantType == ''M''>${memberFirstName} ${memberLastName}<br/></#if>
				<#if applicantType == ''FS''>${spouseFirstName} ${spouseLastName}<br/></#if>
                <#if applicantType == ''LM'' || applicantType == ''LFS''>${bussinessName}<br/></#if>


            ${address}<br/>
            <#if address2?has_content>
            ${address2}<br/>
            </#if>
            ${city} ${provinceState} ${postalZip}<br/>
            ${country}</p>
            <b><u>Private and Confidential</u></b>

            <p>Dear <#if applicantType == ''LFS'' || applicantType == ''LM''>${recipientName}:</#if>
				<#if applicantType == ''M''>${memberFirstName} ${memberLastName}:</#if>
				<#if applicantType == ''FS''>${spouseFirstName} ${spouseLastName}:</#if></p>

            <h3 class="h3Style">
                <div class="inlineBlock">
                <span class="spanLeftMarginRight">
                Re:	</span>
                <span class="spanLeft">
                Application for Family Law Value (FLV)<br/>
				<#if applicantType != ''M''>${memberFirstName} ${memberLastName}<br/></#if>
                Membership number: ${memberNumber}</span>
            </div>
            </h3>
            <hr class="marginTop0"/>


			<p>Please find the enclosed Statement of Family Law Value.
			<#if applicantType ==''LM''>
			Your client, ${memberFirstName} ${memberLastName}, has identified you as their contact person to receive these materials.
			</#if>
			<#if applicantType ==''LFS''>
			Your client, ${spouseFirstName} ${spouseLastName}, has identified you as their contact person to receive these materials.
			</#if>
			<#if applicantType ==''LFS''>
			A copy has also been sent to the OMERS member (or their contact person as directed).
			</#if>
			<#if applicantType ==''FS''>
			Both you and the OMERS member (or their counsel as directed) have been sent a copy.
			</#if>
			<#if applicantType == ''LM''>
			A copy has also been sent to the OMERS member’s former spouse (or their contact person as directed).
			</#if>
			<#if applicantType == ''M''>
			Your former spouse (or their counsel as directed) has also been sent a copy.
			</#if>
			</p>
			<#if applicantType == ''LM''>
			<p>Members who are going through a separation or divorce should review their current beneficiary information with OMERS to ensure it is up to date.  If your client has not already done so, please advise them to review their beneficiary designation to ensure that it continues to align with their wishes. This information can be viewed and/or updated in their personal myOMERS account. The OMERS member can sign in or create an account at myOMERS.com.</p>
			</#if>

			<#if applicantType == ''M''>
			<p>Members who are going through a separation or divorce should review their current beneficiary information with OMERS to ensure it is up to date.  If you have not already done so, please review your beneficiary designation to ensure that it continues to align with your wishes. This information can be viewed and/or updated in your personal myOMERS account. Sign in or create an account at myOMERS.com.</p>
			</#if>

			<#if applicantType == ''LM''>
			<p>Please advise your client that should the parties decide to proceed with a division of pension, any future requested pension estimate(s) will not account for a transfer of the Family Law Value; it will only report unadjusted pension amounts.</p>
			</#if>

			<#if applicantType == ''M''>
			<p>Be advised that should you and your former spouse decide to proceed with a division of pension, any future requested pension estimate(s) will not account for a transfer of the Family Law Value; it will only report unadjusted pension amounts.</p>
			</#if>

			<#if (applicantType == ''M'' || applicantType == ''FS'') && multipleMembershipAVC == true>
<p>Please be advised that should you and your former spouse decide to proceed with the division of the Additional Voluntary Contributions (AVC), the amount seen on each <i>Statement of Family Law Value</i> represent the total AVC account balance for all memberships.</p>
			</#if>

			<#if (applicantType == ''M'' || applicantType == ''LM'') && rcaBenifit == true>
			<p><h4>Retirement Compensation Arrangement (RCA) benefit</h4></p>
<p>Please note that a valuation for a Retirement Compensation Arrangement (RCA) benefit as of the Family Law Valuation Date (FLV) Date is not reported on the attached <i>Statement Of Family Law Value</i>. The <i>Statement Of Family Law Value</i> and its governing legislation does not cover RCA benefits.</p>

			<p><#if applicantType == ''M''> You </#if><#if applicantType == ''LM''>The member </#if> can contact OMERS directly for an RCA benefit estimate (which is not a valuation for marriage breakdown purposes) or other RCA information related to the administration of marriage breakdown.  If <#if applicantType == ''M''> you wish</#if><#if applicantType == ''LM''>the member wishes</#if> to obtain an RCA benefit estimate, <#if applicantType == ''M''> you </#if><#if applicantType == ''LM''>the member </#if> must make the request in writing. </p>

			<p>OMERS will provide an RCA lifetime benefit estimate (pension payable at normal retirement date calculated as at FLV Date) to the member only.  If <#if applicantType == ''M''> you wish</#if><#if applicantType == ''LM''>the member wishes</#if> for the same estimate to be sent to his/her former spouse, then OMERS will require written consent to do so. </p>

			<p>Valuation of the RCA for marriage breakdown purposes will be up to the member and/or former spouse to obtain through an independent actuary.</p>
			</#if>

            <p><h4>We’re here to help</h4></p>
            <p>If you have questions please call Member Experience at +1 416.369.2444 or +1 800.387.0813, Monday to Friday between 8 a.m. and 5 p.m.
			<#if applicantType == ''M''>
			You can also start a conversation using our secure communication channel in your myOMERS account.  To allow us to serve you better, please quote the membership number shown above.
			</#if>
			<#if applicantType != ''M''>
			You can also submit a question using our third-party contact form on omers.com. To allow us to serve you better, please quote the membership number shown above.
			</#if>
			</p>
            <p>Regards,<br/>
            Member Experience<br/>
            </p>

        </div>
	</body>
</html>', true, 1, 'dms_template', current_timestamp);


insert into dmstemplate.template_history (audit_id,template_id, process_id, template_name, template_type, approved_by, modified_by,
                                  modified_on, template_fields, template_data, is_active, version, created_by,
                                  created_on)
values ('beb6e42c-f6ff-432c-b0e6-d17d6e8610e0','6ffd6a5a-198e-11ed-861d-0242ac120001', 'SAD', 'FLV_FollowUpLetter_Template', 'HTML', '', 'dms_template',
        current_timestamp, '[
        {
            "defaultValue": "",
            "fieldName": "currentDate",
            "fieldType": "DATE",
            "isRequired": true
        },
        {
            "defaultValue": "",
            "fieldName": "recipientName",
            "fieldType": "STRING",
            "isRequired": true
        },
        {
            "defaultValue": "",
            "fieldName": "applicantType",
            "fieldType": "STRING",
            "isRequired": true
        },
        {
            "defaultValue": "",
            "fieldName": "memberName",
            "fieldType": "STRING",
            "isRequired": true
        },
        {
            "defaultValue": "",
            "fieldName": "memberNumber",
            "fieldType": "STRING",
            "isRequired": true
        },
        {
            "defaultValue": "",
            "fieldName": "address",
            "fieldType": "STRING",
            "isRequired": true
        },
        {
            "defaultValue": "",
            "fieldName": "address2",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "city",
            "fieldType": "STRING",
            "isRequired": true
        },
        {
            "defaultValue": "",
            "fieldName": "provinceState",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "postalZip",
            "fieldType": "STRING",
            "isRequired": true
        },
        {
            "defaultValue": "",
            "fieldName": "country",
            "fieldType": "STRING",
            "isRequired": true
        },
        {
            "defaultValue": "",
            "fieldName": "spouseName",
            "fieldType": "STRING",
            "isRequired": true
        },
        {
            "defaultValue": "",
            "fieldName": "receivedDate",
            "fieldType": "DATE",
            "isRequired": true
        },
        {
            "defaultValue": "",
            "fieldName": "applicationFeeRequired",
            "fieldType": "BOOLEAN",
            "isRequired": true
        },
        {
            "defaultValue": "",
            "fieldName": "spouseDobNotVerified",
            "fieldType": "BOOLEAN",
            "isRequired": true
        },
        {
            "defaultValue": "",
            "fieldName": "flvInfoMissing",
            "fieldType": "BOOLEAN",
            "isRequired": true
        },
        {
            "defaultValue": "",
            "fieldName": "startDateProofNotProvided",
            "fieldType": "BOOLEAN",
            "isRequired": true
        },
        {
            "defaultValue": "",
            "fieldName": "separationDateProofNotProvided",
            "fieldType": "BOOLEAN",
            "isRequired": true
        },
        {
            "defaultValue": "",
            "fieldName": "footerRefCode",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "bussinessName",
            "fieldType": "STRING",
            "isRequired": false
        }
    ]',
        '<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<#include "pensionsHeader.ftl">
<#include "pensionsFooter.ftl">
</head>
    <body>

          <div id="content">
            <p>${currentDate?date?string(''MMMM dd, yyyy'')}</p>

            <p><#if applicantType == ''LFS'' || applicantType == ''LM''>${recipientName}</#if>
				<#if applicantType == ''M''>${memberName}</#if>
				<#if applicantType == ''FS''>${spouseName}</#if><br/>
            ${address}<br/>
            <#if address2?has_content>
            ${address2}<br/>
            </#if>
            ${city} <#if ProvinceState?has_content> ${provinceState}</#if> ${postalZip}<br/>
            ${country}</p>

            <p>Dear <#if applicantType == ''LFS'' || applicantType == ''LM''>${recipientName}</#if>
				<#if applicantType == ''M''>${memberName}</#if>
				<#if applicantType == ''FS''>${spouseName}</#if>:</p>

            <h3 class="h3Style">
                <div class="inlineBlock">
                <span class="spanLeftMarginRight">
                Re:	</span>
                <span class="spanLeft">
                Application for Family Law Value (FLV)<br/>
				<#if applicantType != ''M''>${memberName}<br/></#if>
                Membership number: ${memberNumber}</span>
            </div>
            </h3>
            <hr class="marginTop0"/>

			<p>This is to confirm receipt of the documents relating to your Application for Family Law Value on ${receivedDate?date?string(''MMMM dd, yyyy'')}.
			<#if applicantType == ''LFS''>Your client, ${spouseName}, has identified you as their contact person to receive these materials. </#if>
			<#if applicantType == ''LM''>Your client, ${memberName}, has identified you as their contact person to receive these materials.</#if></p>

			<p>Upon review of the material submitted, we found the application is incomplete.</p>


			<p><h4>Action required</h4></p>

			<p>To proceed, please send the item(s) listed below to OMERS:</p>

			<ul>


				<#if spouseDobNotVerified == true && applicantType == ''FS''>
                <li>
                    <p>A legible copy of your proof of age.</p>
                </li>
                </#if>

				<#if spouseDobNotVerified == true &&  applicantType != ''FS''>
                <li>
                    <p>A legible copy of ${spouseName}’s proof of age.</p>
                </li>
                </#if>
                <#if flvInfoMissing == true>
                <li>
                    <p>A completed <i>Application for Family Law Value</i> available on <i>www.fsrao.ca</i></p>
                </li>
                </#if>
				<#if startDateProofNotProvided == true>
                <li>
                    <p>Proof of the start date of the spousal relationship (e.g., Appendix A – Joint Declaration of Period of Spousal Relationship; a certified copy of your marriage certificate; certified copy of a court order; family arbitration award or domestic contract).</p>
                </li>
                </#if>
				<#if separationDateProofNotProvided == true>
                <li>
                    <p>Proof of the separation date (e.g., Appendix A – Joint Declaration of Period of Spousal Relationship; Appendix B – Request for Two Family Law Values; a certified copy of a court order; family arbitration award or domestic contract).</p>
                </li>
                </#if>
                <#if applicationFeeRequired == true>
                <li>
                    <p>Application fee of $600.00 (OMERS offers one statement at no cost per membership).</p>
                </li>
                </#if>




			</ul>

			<#if startDateProofNotProvided == true>
			<p>A certified copy is a copy of the original document that has been verified as being a true copy of said document by a lawyer, commissioner of oaths or notary public.</p>
			</#if>

			<p>The Statement of Family Law Value will be provided within 60 days of receipt of the completed application and applicable documents.</p>


            <p><h4>We’re here to help</h4></p>
            <p>If you have questions please call Member Experience at +1 416.369.2444 or +1 800.387.0813, Monday to Friday between 8 a.m. and 5 p.m.
			<#if applicantType == ''M''>
			You can also start a conversation using our secure communication channel in your myOMERS account.  To allow us to serve you better, please quote the membership number shown above.
			</#if>
			<#if applicantType != ''M''>
			You can also submit a question using our third-party contact form on omers.com. To allow us to serve you better, please quote the reference number shown above.
			</#if>
			</p>
            <p>Regards,<br/>
            Member Experience</p>
        </div>
	</body>
</html>', true, 1, 'dms_template', current_timestamp);


insert into dmstemplate.template_history (audit_id,template_id, process_id, template_name, template_type, approved_by, modified_by,
                                  modified_on, template_fields, template_data, is_active, version, created_by,
                                  created_on)
values ('1016bc0e-ec4f-4d60-99a0-de25d5d7ac13','6ffd6a5a-198e-11ed-861d-0242ac120002', 'SAD', 'FLV_FamilyLawForm4B_Template', 'HTML', '', 'dms_template',
        current_timestamp, '[
        {
            "defaultValue": "",
            "fieldName": "page1NameOfMemberLastName",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page1NameOfMemberFirstName",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page1NameOfMemberInitials",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page1NameOfMemberYes",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page1NameOfMemberNo",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page1NameOfSpouseLastName",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page1NameOfSpouseFirstName",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page1NameOfSpouseInitials",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page1NameOfSpouseYes",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page1NameOfSpouseNo",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page1TwoValidationsYes",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page1TwoValidationsNo",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page1SpousalDate",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page1MarriageDate",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page1Together",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page1Joint",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page1Arbitration",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page1FamilyLawDate",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page1FamilyLawValue",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page1MaximumAmount",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page1FamilyLawValue",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2NameOfPension",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2RegistrationNumber",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2Employer",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2Admin",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2Unit",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2StreetNumber",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2StreetName",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2City",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2Province",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2Country",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2Postal",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2Telephone",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2Fax",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2Email",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2PlanMemberLastName",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2PlanMemberFirstName",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2PlanMemberInitials",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2PlanMemberDate",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2PlanMemberEmployee",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2PlanMemberSpouseLastName",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2PlanMemberSpouseFirstName",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2PlanMemberSpouseInitials",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2PlanMemberSpouseDate",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page3TransferLocked",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page3TransferAnother",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page3NoTransfer",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page3NoTransferApplication",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page3TransferRatio",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page3NameOfPlan",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page3Signature",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page3Date",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page3NameOfFirm",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page3Unit",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page3StreetNumber",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page3StreetName",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page3City",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page3Province",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page3Country",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page3Postal",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page3Telephone",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page3Fax",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page3Email",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page5OnOrBefore",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page5After",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page5WoundUp",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page5ValueA",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page5AssumedValueA",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page5WeightedValueA",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page5ValueB",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page5AssumedValueB",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page5WeightedValueB",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page5ValueC",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page5AssumedValueC",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page5WeightedValueC",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page5TotalValue",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page5WeightedT",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page5Initial",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page5Plus",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page5Preliminary",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page6ValueB",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page6AssumedValueB",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page6WeightedValueB",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page6ValueF",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page6AssumedValueF",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page6WeightedValueF",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page6TotalValue",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page6WeightedD",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page6WeightedE",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page6Initial",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page6Plus",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page6Preliminary",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page7Step1Commuted",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page7Step1Accumulated",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page7Step1Initial",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page7Step1Plus",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page7Step1Preliminary",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page7Step2Preliminary",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page7Step2Spousal",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page7Step2Member",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page7Step2FamilyLaw",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page7Step3Max",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page8JoinedDate",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page8FormerDate",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page8FormerDateNA",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page8RetiredDate",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page8RetiredDateNA",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page8Calc1And2Pensionable",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page8Calc1And2PensionableNA",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page8Calc1And2Lifetime",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page8Calc1And2LifetimeMonthly",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page8Calc1And2LifetimeAnnual",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page8Calc1And2Bridging",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page8Calc1And2BridgingMonthly",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page8Calc1And2BridgingAnnual",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page8Calc1And2BridgingNA",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page8Calc1And2Reduction",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page8Calc1And2ReductionMonthly",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page8Calc1And2ReductionAnnual",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page8Calc1And2ReductionNA",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page8Calc1And2Valuation",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page8Calc1And2CreditsYes",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page8Calc1And2CreditsNo",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page8Calc1And2CreditsNA",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page8Calc3Pensionable",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page8Calc3PensionableNA",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page8Calc3Lifetime",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page8Calc3LifetimeMonthly",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page8Calc3LifetimeAnnual",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page8Calc3Bridging",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page8Calc3BridgingMonthly",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page8Calc3BridgingAnnual",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page8Calc3BridgingNA",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page8Calc3Reduction",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page8Calc3ReductionMonthly",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page8Calc3ReductionAnnual",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page8Calc3ReductionNA",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page8Calc3WindUp",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page8Calc3CreditsYes",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page8Calc3CreditsNo",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page8Calc3CreditsNA",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page9Provisions",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page9Details",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page10Actuarial",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page10NonIndex",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page10Index",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page10IndexNA",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page10Rate",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page10RateNA",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page10Mortality",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page10MortalityUnisex",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page10MortalitySex",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page10Percent",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page10PercentNA",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page10Difference",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page10DifferenceNA",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page10Assumption",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page10AssumptionNA",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page10Shortened",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page10ShortenedNA",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page11WindUpNA",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page11WindUpDate",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page11WindUpYes",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page11WindUpNo",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page11WindUpUnknown",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page11GuaranteeYes",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page11GuaranteeNo",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page11Application",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page11ApplicationNA",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page11Ammendments",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page11Year1",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page11Year2",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page11Year3",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page12AVCNA",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page12Family",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page12Spousal",
            "fieldType": "STRING",
            "isRequired": false
        }

    ]',
        '<!DOCTYPE html>
<html>
    <head>
        <style type="text/css">
            @page {
                size: 215.9mm 279.4mm;
                margin: 0 0 0 0 !important;
                padding-top: 0 !important;
            }
            @media print {
                body,
                section[size="A4"] {
                    size: 215.9mm 279.4mm;
                    padding: 0;
                    margin: 0;
                    box-shadow: 0;
                }
                .content {
                    display: block;
                    overflow: hidden;
                    width: 189.6mm;
                }
            }
            @media screen {
                body {
                    background: rgb(204, 204, 204);
                }
                section {
                    background: white;
                    box-shadow: 0 0 0.5cm rgba(0, 0, 0, 0.5);
                }
                section > .horizontalMargins {
                    padding: 10.9mm 0 14.5mm 0 !important;
                }
            }
            body {
                margin-left: auto;
                margin-right: auto;
            }
            section {
                display: block;
                margin: 0 auto;
                margin-bottom: 0.5cm;
            }
            section[size="A4"] {
                width: 215.9mm;
                height: 279.4mm;
                position:relative;
            }
            section > .horizontalMargins {
                margin: 0mm 13.15mm 0mm 13.15mm;
                max-width: 100%;
                display: block;
                padding: 10.9mm 0 14.5mm 0 !important;
            }
            thead > tr > th {
                font-weight: bold;
                margin-top: 15px;
                display: block;
            }
            tbody > tr > td {
                padding: 2pt;
                border: 1px solid black;
                height: 45px;
            }
            tbody {
                vertical-align: top;
            }
            table {
                border-spacing: 0;
                border-collapse: collapse;
                width: 100%;
                text-align: left;
            }
            .content {
                font-size: 10pt;
                font-family: Arial, Helvetica, sans-serif;
            }
            .marginTop0 {
                margin-top: 0px;
            }

            .marginBottom0 {
                margin-bottom: 0px;
            }
            .h3Style {
                margin-bottom: 0px;
                margin-left: 15px;
            }
            .inlineBlock {
                display: inline-block;
            }
            .spanLeftMarginRight {
                float: left;
                margin-right: 20px;
            }
            .spanLeft {
                float: left;
            }
            .bold {
                font-weight: bold;
            }
            .row {
                margin-top: 10px;
            }
            .headerRight hr {
                width: 225px !important;
            }
            .greySection {
                margin-top: 10px;
                font-size: 11pt;
                padding: 5px;
                margin-left: -1px;
                background-color: #d3d3d3;
            }
            .radio {
                vertical-align: middle;
            }
            .underlineInput {
                border-bottom: 1px solid black;
                width: 80pt;
                display: inline-block;
            }
            .horizontalLine {
                display: block;
                margin-top: -10pt;
                width: 100%;
                border-top: 1px solid black;
                margin-bottom: 10pt;
            }
            .pPadding {
                margin-top: 5px;
                margin-bottom: 5px;
            }
            .container {
                display: inline-block;
                position: relative;
                padding-left: 17px;
                cursor: pointer;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
            }
            .checkmark {
                position: absolute;
                top: 0;
                left: 0;
            }
            .header {
                display: block;
                padding-bottom: 7mm;
                width: 100%;
            }
            .leftHeader {
                display: inline-block;
                border-right: 1px solid black;
                height: 100%;
                width: 37%;
            }
            .rightHeader {
                font-family: Arial, Helvetica, sans-serif;
                display: inline-block;
                padding-left: 3mm;
                height: 100%;
                vertical-align: top;
                font-size: 14pt;
                font-weight: bold;
                width: 115mm;
            }
            .rightHeader > .subHeading {
                padding-top: 3mm;
                font-size: 9pt;
                font-weight: normal;
            }
            .page-break {
                display: block;
                page-break-after: always;
            }
            .footerBottom {
                margin-top: 10px;
                text-align: center;
            }
            .footerLeft {
                float: left;
                text-align: left;
            }
            .footerRight {
                float: right;
                text-align: right;
            }
            .pageFooter {
                font-family: Arial, Helvetica, sans-serif;
                font-size: 10px;
                bottom:20pt;
                position:absolute;
                border-top:1px solid #000;
                width:189.6mm;
                margin-left:13.15mm;
                margin-right:13.15mm;
            }
        </style>
    </head>
    <body>
        <!-- Page 1 -->
        <section size="A4">
            <span class="horizontalMargins" style="padding: 10.9mm 0 14.5mm 0 !important">
                <span class="header" style="height: 25mm;">
                    <span class="leftHeader"><span style="display:table-cell"><img src="FSRA_LOGO" width="150" style="vertical-align:top; padding-top:5pt"/>
                        <img src="FSRA_ONTARIO_LOGO" style="padding-left:15pt; vertical-align:top; padding-top:5pt" width="50"/>
                    </span>
                    </span>
                    <span class="rightHeader">
                        <div>Statement of Family Law Value</div>
                        <div>Active Plan Member with a Defined Benefit</div>
                        <div>Family Law Form FL–4B</div>
                        <div class="subHeading">(Under section 67.2(9) of the Pension Benefits Act)</div>
                    </span>
                </span>
                <span class="content">
                    <div class="pPadding">
                        This statement provides the imputed value under the Pension Benefits Act and Family Law Act, for
                        a Plan Member who was an active member of the pension plan on the family law valuation date
                        (e.g., separation date). It is completed by the plan administrator. This statement is provided
                        to both the Plan Member and the Plan Member’s spouse, regardless of who makes the application.
                    </div>
                    <div class="pPadding">
                        The imputed value (referred to as <span class="bold">family law value</span> on this statement)
                        is the value of the pension benefit that was accrued during the spousal relationship. It is
                        calculated as of the family law valuation date. The family law value is used in the calculation
                        of the Plan Member’s net family property. This statement does not entitle the Plan Member’s
                        spouse to a portion of the pension benefit.
                    </div>
                    <div class="pPadding">
                        This statement includes details of how the family law value was calculated. If you have
                        questions about the calculations, contact the plan administrator.
                    </div>
                    <div class="pPadding">
                        Information about the pension valuation and division process can be found in the
                        <a
                            href="https://www.fsrao.ca/consumers/pensions/pensions-and-marriage-breakdown-guide-members-and-their-spouses"
                        >
                            Pensions and Marriage Breakdown – a Guide for Members and their Spouses </a
                        >.
                    </div>
                    <div class="greySection bold">Part A – Family Law Value</div>
                    <table>
                        <thead>
                            <tr>
                                <th colspan="''4">Name of Plan Member</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td style="width: 34%; border-left: 0">Last Name<br>
                                <input type="text" style="width:172pt" value="${page1NameOfMemberLastName}"/></td>
                                <td style="width: 34%">First Name<br>
                                    <input type="text" style="width:172pt" value="${page1NameOfMemberFirstName}"/></td>
                                <td style="width: 6%">Initials<br>
                                    <input type="text"  value="${page1NameOfMemberInitials}"/></td>
                                <td style="border-right: 0" class="radio">
                                    Applicant
                                    <span style="margin-left: 10px">
                                        <label class="container"
                                            >Yes
                                            <#if page1NameOfMemberYes==true>
                                            <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                            <#else>
                                            <span class="checkmark"><input type="checkbox"/></span>
                                            </#if>
                                        </label>
                                        <label class="container"
                                            >No
                                            <#if page1NameOfMemberNo==true>
                                            <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                            <#else>
                                            <span class="checkmark"><input type="checkbox"/></span>
                                            </#if>
                                        </label>
                                    </span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table>
                        <thead>
                            <tr>
                                <th colspan="''4">Name of Plan Member’s Spouse</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td style="width: 34%; border-left: 0">Last Name<br>
                                    <input type="text" style="width:172pt" value="${page1NameOfSpouseLastName}"/></td>
                                <td style="width: 34%">First Name<br>
                                    <input type="text" style="width:172pt" value="${page1NameOfSpouseFirstName}"/></td>
                                <td style="width: 6%">Initials<br>
                                    <input type="text" value="${page1NameOfSpouseInitials}"/></td>
                                <td style="border-right: 0" class="radio">
                                    Applicant
                                    <span style="margin-left: 10px">
                                        <label class="container"
                                            >Yes
                                            <#if page1NameOfSpouseYes==true>
                                            <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                            <#else>
                                            <span class="checkmark"><input type="checkbox"/></span>
                                            </#if>
                                        </label>
                                        <label class="container"
                                            >No
                                            <#if page1NameOfSpouseNo==true>
                                            <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                            <#else>
                                            <span class="checkmark"><input type="checkbox"/></span>
                                            </#if>
                                        </label>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" style="height: 0; border-right: 0; border-left: 0">
                                    <div style="width: 79%; display: table-cell">
                                        You and your spouse have proposed two valuation dates. The plan administrator
                                        will therefore provide two statements. This statement sets out ONE of the two
                                        proposed family law values.
                                    </div>
                                    <div style="display: table-cell; padding-left: 56px" class="radio">
                                        <label class="container"
                                            >Yes
                                            <#if page1TwoValidationsYes==true>
                                            <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                            <#else>
                                            <span class="checkmark"><input type="checkbox"/></span>
                                            </#if>
                                        </label>
                                        <label class="container"
                                            >No
                                            <#if page1TwoValidationsNo==true>
                                            <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                            <#else>
                                            <span class="checkmark"><input type="checkbox"/></span>
                                            </#if>
                                        </label>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div style="margin-top: 10px">
                        <span style="display: table-cell">
                            The starting date of your spousal relationship is (yyyy/mm/dd): &nbsp;&nbsp;&nbsp;
                        <span class="underlineInput"><input type="text" style="width:80pt" value="${page1SpousalDate}"/></span></span>
                    </div>
                    <p style="margin-bottom: 3pt">The starting date is based on:</p>
                    <div style="margin-bottom: 3pt">
                        <label class="container"
                            >your marriage date
                            <#if page1MarriageDate==true>
                            <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                            <#else>
                            <span class="checkmark"><input type="checkbox"/></span>
                            </#if>
                        </label>
                    </div>
                    <div style="margin-top: 3pt; margin-bottom: 3pt">
                        <label class="container"
                            >the date when you and your spouse started living together in a common-law relationship
                            <#if page1Together==true>
                            <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                            <#else>
                            <span class="checkmark"><input type="checkbox"/></span>
                            </#if>
                        </label>
                    </div>
                    <div style="margin-top: 3pt; margin-bottom: 3pt">
                        <label class="container"
                            >the date that was jointly chosen by you and your spouse
                            <#if page1Joint==true>
                            <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                            <#else>
                            <span class="checkmark"><input type="checkbox"/></span>
                            </#if>
                        </label>
                    </div>
                    <div style="margin-top: 3pt">
                        <label class="container"
                            >the date specified in your court order or family arbitration award
                            <#if page1Arbitration==true>
                            <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                            <#else>
                            <span class="checkmark"><input type="checkbox"/></span>
                            </#if>
                        </label>
                    </div>
                    <p>
                        <span style="display: table-cell">
                            Your <span class="bold">family law valuation date</span> is (yyyy/mm/dd):
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <span class="underlineInput"><input type="text" style="width:80pt" value="${page1FamilyLawDate}"/></span></span>
                    </p>
                    <p>
                        <span style="display: table-cell; width: 69%">
                            The <span class="bold">family law value</span> as of this date is:
                        </span>
                        <span style="display: table-cell">
                            <span style="display: table-cell">$</span>
                            <span style="display: table-cell" class="underlineInput"><input type="text" style="width:80pt" value="${page1FamilyLawValue}"/></span>
                            <span style="display: table-cell">&nbsp;&nbsp;GROSS</span>
                        </span>
                    </p>
                    <p>
                        The Plan Member should include the gross family law value as an asset on the Plan Member’s
                        financial statement. The Plan Member should also list future tax liability for the pension as a
                        debt on the financial statement. Consult a family law lawyer or financial advisor for advice on
                        calculating the future tax rate. Neither the plan administrator nor FSRA can provide assistance
                        on determining the future tax liability, completing the financial statement or calculating net
                        family property.
                    </p>
                    <p>
                        <span style="display: table-cell; width: 50%">
                            The <span class="bold">maximum amount</span> that may be transferred as equalization to the
                            Plan Member’s spouse is: &nbsp;
                        </span>
                        <span style="display: table-cell; vertical-align: middle; padding-left: 12pt">
                            <span style="display: table-cell">$</span>
                            <span style="display: table-cell" class="underlineInput"><input type="text" style="width:80pt" value="${page1MaximumAmount}"/></span>
                            <span style="display: table-cell">&nbsp;&nbsp;GROSS</span>
                        </span>
                    </p>
                    <span class="horizontalLine"></span>
                    <span>
                        <span class="bold">IMPORTANT:</span>
                        <div>
                            See
                            <a
                                href="https://www.fsrao.ca/consumers/pensions/pensions-and-marriage-breakdown-guide-members-and-their-spouses"
                            >
                                Pensions and Marriage Breakdown – a Guide for Members and their Spouses
                            </a>
                            for treatment of interest.
                        </div>
                    </span>
                </span>
            </span>
            <div class="pageFooter">
                <div class="footerBottom">
                    <span class="footerLeft">PF-131E (2022)</span>
                    <span>© Queen''s Printer for Ontario</span>
                    <span class="footerRight" id="pageCount"></span><span class="footerRight" id="pageNumber">Page 1 of 12</span>
                </div>
            </div>
        </section>
        <!-- Page 2 -->
        <section size="A4">
            <span class="horizontalMargins">
                <span class="content">
                    <div class="greySection bold" style="margin-top: 0">Part B – Pension Plan Information</div>
                    <table>
                        <tbody>
                            <tr>
                                <td style="width: 70%; border-left: 0; border-top: 0">Name of Pension Plan<br>
                                    <input type="text" style="width:375pt" value="${page2NameOfPension}"/></td>
                                <td style="width: 30%; border-right: 0; border-top: 0">Registration Number<br>
                                    <input type="text" style="width:159pt" value="${page2RegistrationNumber}"/></td>
                            </tr>
                            <tr>
                                <td colspan="2" style="border-left: 0; border-right: 0">
                                    Name of Employer/Union/Professional Association<br>
                                    <input type="text" style="width:189.6mm" value="${page2Employer}"/>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="width: 70%; border-left: 0; border-right: 0">
                                    Plan Administrator<br>
                                    <input type="text" style="width:189.6mm" value="${page2Admin}"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table style="margin-top: 10pt">
                        <thead>
                            <colgroup>
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                            </colgroup>
                            <tr>
                                <th colspan="10">Plan Administrator’s Contact Information</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="2" style="border-left: 0">Unit Number<br>
                                    <input type="text" style="width:106pt" value="${page2Unit}"/></td>
                                <td colspan="2">Street Number<br>
                                    <input type="text" style="width:106pt" value="${page2StreetNumber}"/></td>
                                <td colspan="8" style="border-right: 0">Street Name<br>
                                    <input type="text" style="width:310pt" value="${page2StreetName}"/></td>
                            </tr>
                            <tr>
                                <td colspan="3" style="border-left: 0">City<br>
                                    <input type="text" style="width:155pt" value="${page2City}"/></td>
                                <td colspan="2">Province/State<br>
                                    <input type="text" style="width:106pt" value="${page2Province}"/></td>
                                <td colspan="2">Country<br>
                                    <input type="text" style="width:106pt" value="${page2Country}"/></td>
                                <td colspan="3" style="border-right: 0">Postal Code/Zip Code<br>
                                    <input type="text" style="width:145pt" value="${page2Postal}"/></td>
                            </tr>
                            <tr>
                                <td colspan="2" style="border-left: 0">Telephone Number<br>
                                    <input type="text" style="width:106pt" value="${page2Telephone}"/></td>
                                <td colspan="2">Fax Number<br>
                                    <input type="text" style="width:106pt" value="${page2Fax}"/></td>
                                <td colspan="8" style="border-right: 0">E-mail Address<br>
                                    <input type="text" style="width:310pt" value="${page2Email}"/></td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="greySection bold" style="margin-top: 20pt">
                        Part C – Information about the Plan Member
                    </div>
                    <table>
                        <tbody>
                            <colgroup>
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                            </colgroup>
                            <tr>
                                <td colspan="5" style="border-left: 0; border-top: 0">Last Name<br>
                                    <input type="text" style="width:265pt" value="${page2PlanMemberLastName}"/></td>
                                <td colspan="4" style="border-top: 0">First Name<br>
                                    <input type="text" style="width:212pt" value="${page2PlanMemberFirstName}"/></td>
                                <td style="border-right: 0; border-top: 0">Initials<br>
                                    <input type="text" value="${page2PlanMemberInitials}"/></td>
                            </tr>
                            <tr>
                                <td colspan="3" style="border-left: 0">Date of Birth (yyyy/mm/dd)<br>
                                    <input type="text" style="width:159pt" value="${page2PlanMemberDate}"/></td>
                                <td colspan="7" style="border-right: 0">
                                    Employee/Pension Plan Identification Number, if applicable<br>
                                    <input type="text" style="width:371pt" value="${page2PlanMemberEmployee}"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="greySection bold" style="margin-top: 20pt">
                        Part D – Information about the Plan Member’s Spouse
                    </div>
                    <table>
                        <tbody>
                            <colgroup>
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                            </colgroup>
                            <tr>
                                <td colspan="3" style="border-left: 0; border-top: 0">Last Name<br>
                                    <input type="text" style="width:159pt" value="${page2PlanMemberSpouseLastName}"/></td>
                                <td colspan="3" style="border-top: 0">First Name<br>
                                    <input type="text" style="width:159pt" value="${page2PlanMemberSpouseFirstName}"/></td>
                                <td style="border-top: 0">Initials<br>
                                    <input type="text" style="width:53pt" value="${page2PlanMemberSpouseInitials}"/></td>
                                <td colspan="3" style="border-right: 0; border-top: 0">Date of Birth (yyyy/mm/dd)<br>
                                    <input type="text" style="width:159pt" value="${page2PlanMemberSpouseDate}"/></td>
                            </tr>
                        </tbody>
                    </table>
                </span>
            </span>
            <div class="pageFooter">
                <div class="footerBottom">
                    <span class="footerLeft">PF-131E (2022)</span>
                    <span>© Queen''s Printer for Ontario</span>
                    <span class="footerRight" id="pageCount"></span><span class="footerRight" id="pageNumber">Page 2 of 12</span>
                </div>
            </div>
        </section>
        <!-- Page 3 -->
        <section size="A4">
            <span class="horizontalMargins">
                <span class="content">
                    <div class="greySection bold" style="margin-top: 0">
                        Part E – Transfer Options for the Plan Member’s Spouse
                    </div>
                    <div style="margin-top: 5pt">
                        If the Plan Member is required to make an equalization payment, up to 50% of the family law
                        value can be assigned to the Plan Member’s spouse in a court order, family arbitration award or
                        domestic contract. In that event, the following transfer options are available to the Plan
                        Member’s spouse:
                    </div>
                    <div style="margin-top: 10pt">
                        <label class="container">
                            <#if page3TransferLocked==true>
                            <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                            <#else>
                            <span class="checkmark"><input type="checkbox"/></span>
                            </#if>
                            Transfer lump sum to a locked-in retirement account (LIRA) or to a life income fund (LIF).
                            (Note: The earliest date the Plan Member’s spouse may buy a LIF is anytime during the
                            calendar year before the year they turn 55 years of age. Up to 50 per cent of the money that
                            is transferred into the LIF may be withdrawn within 60 days of transferring the money to the
                            LIF using FSRA’s
                            <span class="bold">
                                Form 5.2 – Application to withdraw or transfer up to 50% of the money transferred into a
                                Schedule 1.1 LIF.)
                            </span>
                        </label>
                    </div>
                    <div style="margin-top: 5pt">
                        <label class="container">
                            <#if page3TransferAnother==true>
                            <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                            <#else>
                            <span class="checkmark"><input type="checkbox"/></span>
                            </#if>
                            Transfer lump sum to another pension plan in any Canadian jurisdiction. This option will
                            only be available if the plan administrator of the receiving pension plan agrees to accept
                            the transfer and administer the transferred amount in accordance with the Ontario Pension
                            Benefits Act.
                        </label>
                    </div>
                    <div style="margin-top: 5pt">
                        <label class="container">
                            <#if page3NoTransfer==true>
                            <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                            <#else>
                            <span class="checkmark"><input type="checkbox"/></span>
                            </#if>
                            <span>No transfer options are available. This is because:</span>
                        </label>
                    </div>
                    <span style="width: 100%;" class="underlineInput"><input type="textarea" style="height:55pt; width:189.6mm; text-align: top;" value="${page3NoTransferApplication}"/></span>
                    <div class="greySection bold" style="margin-top: 30pt">Part F – Pension Fund Status</div>
                    <div style="margin-top: 5px">
                        <span style="display: table-cell">
                            The <span class="bold">transfer ratio </span>of the pension plan for the purposes of this
                            statement is: &nbsp;&nbsp;
                        <span class="underlineInput" style="width:80pt"><input type="text" style="width:80pt" value="${page3TransferRatio}"/></span></span>
                    </div>

                    <p>
                        <span class="bold">Note: </span>The transfer ratio of a pension plan reflects the funded status
                        of the pension plan as of a specific date and may change. If the transfer ratio is less than 1.0
                        at the time of payment, there may be limits on the plan administrator’s ability to transfer the
                        entire family law value amount to the Plan Member’s spouse. Any balance owing could be paid
                        within five years of the initial payment.
                    </p>
                    <div class="greySection bold" style="margin-top: 20pt">
                        Part G – Certification by the Plan Administrator
                    </div>
                    <div style="margin-top: 5px; margin-bottom: 5px">
                        I certify that this statement is accurate based on the information provided by the applicant in
                        their <span class="bold">Application for Family Law Value (Family Law Form FL–1)</span> and the
                        data contained in the pension plan records.
                    </div>
                    <table>
                        <tbody>
                            <tr>
                                <td
                                    colspan="2"
                                    style="border-left: 0; border-right: 0; border-top: 1px solid black"
                                >
                                    Name of plan administrator or plan administrator’s authorized agent or
                                    representative (printed)<br>
                                    <input type="text" style="width:189.6mm" value="${page3NameOfPlan}"/>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 80%; border-left: 0; border-top: 0">
                                    Signature of plan administrator or plan administrator’s authorized agent or
                                    representative<br>
                                    <input type="text" style="width:424pt" value="${page3Signature}"/>
                                </td>
                                <td style="width: 20%; border-right: 0; border-top: 0">Date (yyyy/mm/dd)<br>
                                    <input type="text" style="width:106pt" value="${page3Date}"/></td>
                            </tr>
                        </tbody>
                    </table>
                    <table style="margin-top: 10pt">
                        <thead>
                            <colgroup>
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                            </colgroup>
                            <tr>
                                <th colspan="10">
                                    Information about the plan administrator’s authorized agent or representative (if
                                    applicable)
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="10" style="border-left: 0; border-right: 0">Firm/Company Name<br>
                                    <input type="text" style="width:189.6mm" value="${page3NameOfFirm}"/></td>
                            </tr>
                            <tr>
                                <td colspan="2" style="border-left: 0">Unit Number<br>
                                    <input type="text" style="width:106pt" value="${page3Unit}"/></td>
                                <td colspan="2">Street Number<br>
                                    <input type="text" style="width:106pt" value="${page3StreetNumber}"/></td>
                                <td colspan="8" style="border-right: 0">Street Name<br>
                                    <input type="text" style="width:310pt" value="${page3StreetName}"/></td>
                            </tr>
                            <tr>
                                <td colspan="3" style="border-left: 0">City<br>
                                    <input type="text" style="width:155pt" value="${page3City}"/></td>
                                <td colspan="2">Province/State<br>
                                    <input type="text" style="width:106pt" value="${page3Province}"/></td>
                                <td colspan="2">Country<br>
                                    <input type="text" style="width:106pt" value="${page3Country}"/></td>
                                <td colspan="3" style="border-right: 0">Postal Code/Zip Code<br>
                                    <input type="text" style="width:145pt" value="${page3Postal}"/></td>
                            </tr>
                            <tr>
                                <td colspan="2" style="border-left: 0">Telephone Number<br>
                                    <input type="text" style="width:106pt" value="${page3Telephone}"/></td>
                                <td colspan="2">Fax Number<br>
                                    <input type="text" style="width:106pt" value="${page3Fax}"/></td>
                                <td colspan="8" style="border-right: 0">E-mail Address<br>
                                    <input type="text" style="width:310pt" value="${page3Email}"/></td>
                            </tr>
                        </tbody>
                    </table>
                </span>
            </span>
            <div class="pageFooter">
                <div class="footerBottom">
                    <span class="footerLeft">PF-131E (2022)</span>
                    <span>© Queen''s Printer for Ontario</span>
                    <span class="footerRight" id="pageCount"></span><span class="footerRight" id="pageNumber">Page 3 of 12</span>
                </div>
            </div>
        </section>
        <!-- Page 4 -->
        <section size="A4">
            <span class="horizontalMargins">
                <span class="content">
                    <div class="greySection bold" style="margin-top: 0">Next Steps</div>
                    <div style="margin-top: 5pt" class="bold">
                        If Your Decision is Not to Divide the Family Law Value
                    </div>
                    <ul style="padding-left: 15pt; margin-top: 5pt">
                        <li style="padding-bottom: 3pt">
                            Consider informing the plan administrator that the family law value is not going to be
                            divided.
                        </li>
                        <li>Consider updating your spouse and beneficiary designation information.</li>
                    </ul>
                    <div style="margin-top: 5pt" class="bold">If Your Decision is to Divide the Family Law Value</div>
                    <ol style="padding-left: 15pt; margin-top: 5pt">
                        <li style="padding-bottom: 3pt">
                            Finalize the court order, family arbitration award or domestic contract. This document must:

                            <div style="padding-bottom: 3pt; padding-top: 3pt">
                                <span style="display: table-cell">a.&nbsp;&nbsp;</span>
                                <span style="display: table-cell">state the family law valuation date;</span>
                            </div>
                            <div style="padding-bottom: 3pt">
                                <span style="display: table-cell">b.&nbsp;&nbsp;</span>
                                <span style="display: table-cell">
                                    <span
                                        >include the name of the pension plan (as stated in
                                        <span class="bold">Part B</span>);
                                    </span>
                                </span>
                            </div>
                            <div style="padding-bottom: 3pt">
                                <span style="display: table-cell">c.&nbsp;&nbsp;</span>
                                <span style="display: table-cell">
                                    <span>authorize the lump sum transfer from the pension plan; and</span>
                                </span>
                            </div>
                            <div style="padding-bottom: 3pt">
                                <span style="display: table-cell">d.&nbsp;&nbsp;</span>
                                <span style="display: table-cell">
                                    state the amount to be transferred as either a specified amount ($) or a percentage
                                    (%) that does not exceed 50% of the family law value.
                                </span>
                            </div>
                        </li>
                        <li style="padding-bottom: 3pt">
                            The court order, family arbitration award or domestic contract must be a certified copy. A
                            “certified copy” is a copy of the original document that has been certified as being a true
                            copy of the original document.
                        </li>
                        <li style="padding-bottom: 3pt">
                            The Plan Member’s spouse must complete the
                            <span class="bold">
                                Spouse’s Application for Transfer of a Lump Sum (Family Law Form FL–5)
                            </span>
                            and send this form together with the final court order, family arbitration award or domestic
                            contract (as applicable) to the plan administrator. The plan administrator may also require
                            the following additional information:
                        </li>
                    </ol>
                    <div>Other important information about how OMERS Administration Corporation (OMERS) will administer a settlement from the OMERS Primary Pension Plan (the Plan), if any.</div>
                    <div style="margin-top:5pt">If member has started their pension:</div>
                    <div style="margin-top:5pt">OMERS is not authorized to administer funds to a former spouse arising from marriage breakdown that have already been paid from the Plan.</div>
                    <div style="margin-top:5pt">If OMERS has reported on page 8/12 of this Statement that the member has retired (i.e. started to commence a pension) since this Statement has been issued, then:</div>
                    <ul>
                        <li style="margin-top:5pt">
                            The amount OMERS has been directed to settle from the Plan will be reduced.
                        </li>
                        <li style="margin-top:5pt">The reduction is in proportion to the member’s pension that would have been adjusted (reduced) as a result of the settlement transfer amount retroactive to the commencement date of the retirement pension.</li>
                        <li style="margin-top:5pt">The member and the former spouse will have to manage the difference outside the Plan.</li>
                    </ul>
                    <div>
                        The calculations performed for the Family Law Value in this Statement set out the “property” that is the pension. The prescribed calculations and values reported assume the member has not commenced a pension.  However, if the member has started a pension since his/her Family Law Value Date but before the settlement has been applied for, then each month s/he will have received a full pension benefit from the Plan. The monthly pension already paid includes the pension property value reported in this Statement. Once the full benefit (in this case monthly) is paid, the portion of the member’s benefit that would be adjusted to account for the settlement (retroactive to his/her retirement) no longer forms part of the member’s benefit that is available for division from the Plan.
                    </div>
                    <div style="margin-top:10pt">
                        Note: Interest will be added to the former spouse’s share of the Family Law Value from the Family Law Valuation Date to the beginning of the month in which the transfer is made, if:
                    </div>
                    <div style="margin-top:5pt">
                        <span style="display: table-cell">(i)&nbsp;&nbsp;</span>
                        <span style="display: table-cell">
                            <span>the former spouse’s share is expressed as a proportion (i.e. percentage) of the Family Law Value in the parties’ settlement instrument (court order, family arbitration award or domestic contract); or,</span>
                        </span>
                    </div>
                    <div style="margin-top:5pt">
                        <span style="display: table-cell">(ii)&nbsp;&nbsp;</span>
                        <span style="display: table-cell">
                            <span>the former spouse’s share is expressed as a specified amount and the settlement instrument explicitly requires that interest is to be paid on that amount.</span>
                        </span>
                    </div>
                    <div style="margin-top:10pt">
                        <span style="width: 100%;" class="underlineInput"></span>
                        <span class="bold" style="display: block">IMPORTANT:</span>
                        If the Plan Member terminates or retires before the Plan Member’s spouse submits the
                        <span class="bold">Spouse’s Application for Transfer of a Lump Sum (Family Law Form FL–5) </span
                        >, the plan administrator may not be able to fully implement the transfer.
                    </div>
                </span>
            </span>
            <div class="pageFooter">
                <div class="footerBottom">
                    <span class="footerLeft">PF-131E (2022)</span>
                    <span>© Queen''s Printer for Ontario</span>
                    <span class="footerRight" id="pageCount"></span><span class="footerRight" id="pageNumber">Page 4 of 12</span>
                </div>
            </div>
        </section>
        <!-- Page 5 -->
        <section size="A4">
            <span class="horizontalMargins">
                <span class="header"style="height: 12mm; padding-bottom:5mm">
                    <span class="leftHeader"> </span>
                    <span class="rightHeader">
                        <div>Worksheet – Calculation of Preliminary Value, Family Law Value and Maximum Transfer</div>
                    </span>
                </span>
                <span class="content">
                    <p style="margin-bottom:0">
                        The Worksheet and Additional Disclosure sections provide details and data on the calculations for independent
                        verification. Any calculations that are not applicable will be left blank by the plan administrator.
                        The following information is provided on the Worksheet:
                        <ul style="margin-top:0">
                            <li>
                                Step 1 is the calculation of the preliminary value.
                            </li>
                            <li>
                                Step 2 is the calculation of the family law value.
                            </li>
                            <li>
                                Step 3 is the calculation of the maximum transfer.
                            </li>
                        </ul>
                    </p>
                    <div class="greySection bold" style="margin-top: 0">Step 1 – Calculation of Preliminary Value</div>
                    <p>
                        <span class="bold">Note:</span> The <span class="bold">preliminary value</span> is the total value of the pension accrued by the Plan Member as of the family law valuation
                        date. It has not been adjusted to reflect the period of the spousal relationship.
                        </p>
                    <div>
                        The following <span class="bold">Calculation</span> applies to the Plan Member:
                    </dv>
                    <div style="margin-top: 5pt">
                        <label class="container">
                            <span>
                                <#if page5OnOrBefore==true>
                                <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                <#else>
                                <span class="checkmark"><input type="checkbox"/></span>
                                </#if>
                            The family law valuation date is <span class="bold">on or before</span> the Plan Member’s early unreduced retirement date. See <span class="bold">Calculation 1.</span>
                        </label>
                    </div>
                    <div style="margin-top: 5pt">
                        <label class="container">
                            <#if page5After==true>
                            <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                            <#else>
                            <span class="checkmark"><input type="checkbox"/></span>
                            </#if>
                            The family law valuation date is <span class="bold">after</span> the Plan Member’s early unreduced retirement date. See <span class="bold">Calculation 2.</span>
                        </label>
                    </div>
                    <div style="margin-top: 5pt">
                        <label class="container">
                            <#if page5WoundUp==true>
                            <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                            <#else>
                            <span class="checkmark"><input type="checkbox"/></span>
                            </#if>
                            The pension plan is wound up. See <span class="bold">Calculation 3</span> if the Plan Member is included in the wind up group and the
                            effective date of the wind up is <span class="bold">on or before</span> the family law valuation date. See <span class="bold">Calculation 1 or 2</span> (as applicable) if
                            the wind up occurred <span class="bold">after</span> the family law valuation date.
                        </label>
                    </div>
                    <table style="margin-top: 10pt">
                        <thead>
                            <colgroup>
                                <col width="13.33%" />
                                <col width="15%" />
                                <col width="21.66%" />
                                <col width="8%" />
                                <col width="23.33%" />
                                <col width="18.33%" />
                            </colgroup>
                            <tr>
                                <th colspan="6" style="border:1px solid #000; background-color: #d3d3d3;">
                                    <div class="bold">Calculation 1:</div>
                                    <div style="font-weight: normal">Family law valuation date is on or before the Plan Member’s early unreduced retirement date</div>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="radio">
                                <td style="height:0">Value <span class="bold">“A”</span> is:</td>
                                <td style="height:0">$<input type="text" style="width:65pt" value="${page5ValueA}"/></td>
                                <td style="height:0">Assumed start age for
                                    pension Value <span class="bold">“A”</span> is:</td>
                                <td style="height:0"><input type="text" style="width:43pt" value="${page5AssumedValueA}"/></td>
                                <td style="height:0">Weighted Value of <span class="bold">“A”</span> is</td>
                                <td style="height:0">$<input type="text" style="width:77pt" value="${page5WeightedValueA}"/></td>
                            </tr>
                            <tr class="radio">
                                <td style="height:0">Value <span class="bold">“B”</span> is:</td>
                                <td style="height:0">$<input type="text" style="width:65pt" value="${page5ValueB}"/></td>
                                <td style="height:0">Assumed start age for
                                    pension Value <span class="bold">“B”</span> is:</td>
                                <td style="height:0"><input type="text" style="width:43pt" value="${page5AssumedValueB}"/></td>
                                <td style="height:0">Weighted Value of <span class="bold">“B”</span> is</td>
                                <td style="height:0">$<input type="text" style="width:77pt" value="${page5WeightedValueB}"/></td>
                            </tr>
                            <tr class="radio">
                                <td style="height:0">Value <span class="bold">“C”</span> is:</td>
                                <td style="height:0">$<input type="text" style="width:65pt" value="${page5ValueC}"/></td>
                                <td style="height:0">Assumed start age for
                                    pension Value <span class="bold">“C”</span> is:</td>
                                <td style="height:0"><input type="text" style="width:43pt" value="${page5AssumedValueC}"/></td>
                                <td style="height:0">Weighted Value of <span class="bold">“C”</span> is</td>
                                <td style="height:0">$<input type="text" style="width:77pt" value="${page5WeightedValueC}"/></td>
                            </tr>
                            <tr class="radio">
                                <td colspan="5" style="text-align: right; height:30px">Total Weighted Value is&nbsp;&nbsp;&nbsp;</td>
                                <td style="height:0">$<input type="text" style="width:77pt" value="${page5TotalValue}"/></td>
                            </tr>
                            <tr class="radio">
                                <td colspan="6" style="height:30px">
                                    Weighting factor <span class="bold">“T”</span> is:
                                    <input type="text" style="width:80pt" value="${page5WeightedT}"/>
                                    years (includes one-twelfth of a year for each full month during the period)
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table style="margin-top: 5pt">
                        <thead>
                            <colgroup>
                                <col width="70%" />
                                <col width="15%" />
                                <col width="15%" />
                            </colgroup>
                        </thead>
                        <tbody>
                            <tr class="radio">
                                <td style="height:0">Initial preliminary value (total weighted value)</td>
                                <td style="height:0">&nbsp;&nbsp;$<input type="text" style="width:55pt" value="${page5Initial}"/></td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= G</span></td>

                            </tr>
                            <tr class="radio">
                                <td style="height:0">Plus, surplus assets payable, if applicable (0 if not applicable or unknown) </td>
                                <td style="height:0">&nbsp;&nbsp;$<input type="text" style="width:55pt" value="${page5Plus}"/></td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= surplus</span></td>

                            </tr>
                            <tr class="radio">
                                <td style="height:0"><span class="bold">Preliminary value as of the family law valuation date</span></td>
                                <td style="height:0">&nbsp;&nbsp;$<input type="text" style="width:55pt" value="${page5Preliminary}"/></td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= G + surplus</span></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="bold" style="padding-top:5pt; padding-bottom:5pt">
                        For information purposes only:
                    </div>
                    <ul style="padding-left: 15pt; margin-top:5pt">
                        <li>The preliminary value is the sum of the weighted Values of A, B and C.</li>
                        <li>The calculations for Values A, B and C are made based on different assumptions about when the Plan
                        Member will start their pension in the future.</li>
                        <li>Value A assumes the Plan Member will start their pension on the date that results in a pension with the greatest value.</li>
                        <li>Value B assumes the Plan Member will start their pension at their normal retirement date.</li>
                        <li>Value C assumes the Plan Member’s pension will start at the earliest date when they would be eligible to be paid an
                        unreduced pension if their employment or plan membership continued to that date.</li>
                        <li>Weightings are assigned to Values A, B and C based on the number of years from the family law valuation date to
                        the date when the Plan Member would be first eligible to retire with an unreduced pension (“T” factor). Weightings for
                        the T factor between those shown on the table are adjusted accordingly. </li>
                    </ul>
                </span>
            </span>
            <div class="pageFooter">
                <div class="footerBottom">
                    <span class="footerLeft">PF-131E (2022)</span>
                    <span>© Queen''s Printer for Ontario</span>
                    <span class="footerRight" id="pageCount"></span><span class="footerRight" id="pageNumber">Page 5 of 12</span>
                </div>
            </div>
        </section>
        <!-- Page 6 -->
        <section size="A4">
            <span class="horizontalMargins">
                <span class="content">
                    <table style="width:85%; margin-left:auto; margin-right:auto; text-align:center">
                        <thead>
                            <colgroup>
                                <col width="25%" />
                                <col width="25%" />
                                <col width="25%" />
                                <col width="25%" />
                            </colgroup>
                            <tr>
                                <th style="border:1px solid #000; background-color: #d3d3d3; font-weight: normal">
                                    <span class="bold">T</span> factor
                                </th>
                                <th style="border:1px solid #000; background-color: #d3d3d3; font-weight: normal">
                                    Value <span class="bold">A</span> weighting
                                </th>
                                <th style="border:1px solid #000; background-color: #d3d3d3; font-weight: normal">
                                    Value <span class="bold">B</span> weighting
                                </th>
                                <th style="border:1px solid #000; background-color: #d3d3d3; font-weight: normal">
                                    Value <span class="bold">C</span> weighting
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="radio">
                                <td style="height:0">30 years or more years</td>
                                <td style="height:0">85.0%</td>
                                <td style="height:0">6.0%</td>
                                <td style="height:0">9.0%</td>
                            </tr>
                            <tr class="radio">
                                <td style="height:0">20 years</td>
                                <td style="height:0">40.0%</td>
                                <td style="height:0">24.0%</td>
                                <td style="height:0">36.0%</td>
                            </tr>
                            <tr class="radio">
                                <td style="height:0">10 years</td>
                                <td style="height:0">10.0%</td>
                                <td style="height:0">36.0%</td>
                                <td style="height:0">54.0%</td>
                            </tr>
                            <tr class="radio">
                                <td style="height:0">0 year</td>
                                <td style="height:0">0.0%</td>
                                <td style="height:0">40.0%</td>
                                <td style="height:0">60.0%</td>
                            </tr>
                        </tbody>
                    </table>
                    <table style="margin-top: 10pt">
                        <thead>
                            <colgroup>
                                <col width="13.33%" />
                                <col width="15%" />
                                <col width="21.66%" />
                                <col width="8%" />
                                <col width="23.33%" />
                                <col width="18.33%" />
                            </colgroup>
                            <tr>
                                <th colspan="6" style="border:1px solid #000; background-color: #d3d3d3;">
                                    <div class="bold">Calculation 2:</div>
                                    <div style="font-weight: normal">Family law valuation date is <span class="bold">after</span> the Plan Member’s early unreduced retirement date </div>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="radio">
                                <td>Value <span class="bold">“B”</span> is:</td>
                                <td>$<input type="text" style="width:65pt" value="${page6ValueB}"/></td>
                                <td>Assumed start age for
                                    pension Value <span class="bold">“B”</span> is:</td>
                                <td><input type="text" style="width:43pt" value="${page6AssumedValueB}"/></td>
                                <td>Weighted Value of <span class="bold">“B”</span> is</td>
                                <td>$<input type="text" style="width:77pt" value="${page6WeightedValueB}"/></td>
                            </tr>
                            <tr class="radio">
                                <td>Value <span class="bold">“F”</span> is:</td>
                                <td>$<input type="text" style="width:65pt" value="${page6ValueF}"/></td>
                                <td>Assumed start age for
                                    pension Value <span class="bold">“F”</span> is:</td>
                                <td><input type="text" style="width:43pt" value="${page6AssumedValueF}"/></td>
                                <td>Weighted Value of <span class="bold">“F”</span> is</td>
                                <td>$<input type="text" style="width:77pt" value="${page6WeightedValueF}"/></td>
                            </tr>
                            <tr class="radio">
                                <td colspan="5" style="text-align: right; height:30px">Total Weighted Value is&nbsp;&nbsp;&nbsp;</td>
                                <td>$<input type="text" style="width:77pt" value="${page6TotalValue}"/></td>
                            </tr>
                            <tr class="radio">
                                <td colspan="6" style="height:30px">
                                    Weighting factor <span class="bold">“D”</span> is:
                                    <input type="text" style="width:80pt" value="${page6WeightedD}"/>
                                    years (includes one-twelfth of a year for each full month during the period)
                            </tr>
                            <tr class="radio">
                                <td colspan="6" style="height:30px">
                                    Weighting factor <span class="bold">“E”</span> is:
                                    <input type="text" style="width:80pt" value="${page6WeightedE}"/>
                                    years (includes one-twelfth of a year for each full month during the period)
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table style="margin-top: 5pt">
                        <thead>
                            <colgroup>
                                <col width="70%" />
                                <col width="15%" />
                                <col width="15%" />
                            </colgroup>
                        </thead>
                        <tbody>
                            <tr class="radio">
                                <td>Initial preliminary value (total weighted value)</td>
                                <td>&nbsp;&nbsp;$<input type="text" style="width:55pt" value="${page6Initial}"/></td>
                                <td style="background-color: #d3d3d3; height:30px"><span class="bold">= G</span></td>

                            </tr>
                            <tr class="radio">
                                <td>Plus, surplus assets payable, if applicable (0 if not applicable or unknown) </td>
                                <td>&nbsp;&nbsp;$<input type="text" style="width:55pt" value="${page6Plus}"/></td>
                                <td style="background-color: #d3d3d3; height:30px"><span class="bold">= surplus</span></td>

                            </tr>
                            <tr class="radio">
                                <td><span class="bold">Preliminary value as of the family law valuation date</span></td>
                                <td>&nbsp;&nbsp;$<input type="text" style="width:55pt" value="${page6Preliminary}"/></td>
                                <td style="background-color: #d3d3d3; height:30px"><span class="bold">= G + surplus</span></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="bold" style="padding-top:5pt; padding-bottom:5pt">
                        For information purposes only:
                    </div>
                    <ul style="padding-left: 15pt; margin-top:5pt">
                        <li>The preliminary value is the sum of the weighted Values of B and F.</li>
                        <li>The calculations for Values B and F are made based on different assumptions about when the Plan Member
                            will start their pension in the future.</li>
                        <li>Value B assumes the Plan Member will start their pension at their normal retirement date.</li>
                        <li>Value F assumes the Plan Member will start their pension on the family law valuation date.</li>
                        <li>If the family law valuation date is on or after the normal retirement date, the preliminary value is equal to Value F.</li>
                        <li>Weightings are assigned to Values B and F based on the % ratio (E/D ratio) of the number of years from the family
                            law valuation date to the normal retirement date (factor E) over the number of years from the date when the Plan
                            Member would be first eligible to retire with an unreduced pension to the normal retirement date (factor D).
                            Weightings for E/D ratio between those shown on the table are adjusted accordingly.</li>
                    </ul>
                    <table style="width:70%; margin-top:10pt; margin-left:auto; margin-right:auto; text-align:center">
                        <thead>
                            <colgroup>
                                <col width="33.33%" />
                                <col width="33.33%" />
                                <col width="33.33%" />
                            </colgroup>
                            <tr>
                                <th style="border:1px solid #000; background-color: #d3d3d3; font-weight: normal">
                                    <span class="bold">E/D ratio (%)</span>
                                </th>
                                <th style="border:1px solid #000; background-color: #d3d3d3; font-weight: normal">
                                    Value <span class="bold">B</span> weighting
                                </th>
                                <th style="border:1px solid #000; background-color: #d3d3d3; font-weight: normal">
                                    Value <span class="bold">F</span> weighting
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="radio">
                                <td style="height:0">99%</td>
                                <td style="height:0">40.6%</td>
                                <td style="height:0">59.4%</td>
                            </tr>
                            <tr class="radio">
                                <td style="height:0">75%</td>
                                <td style="height:0">55.0%</td>
                                <td style="height:0">45.0%</td>
                            </tr>
                            <tr class="radio">
                                <td style="height:0">50%</td>
                                <td style="height:0">70.0%</td>
                                <td style="height:0">30.0%</td>
                            </tr>
                            <tr class="radio">
                                <td style="height:0">25%</td>
                                <td style="height:0">85.0%</td>
                                <td style="height:0">15.0%</td>
                            </tr>
                            <tr class="radio">
                                <td style="height:0">1%</td>
                                <td style="height:0">99.4%</td>
                                <td style="height:0">0.5%</td>
                            </tr>
                        </tbody>
                    </table>
                </span>
            </span>
            <div class="pageFooter">
                <div class="footerBottom">
                    <span class="footerLeft">PF-131E (2022)</span>
                    <span>© Queen''s Printer for Ontario</span>
                    <span class="footerRight" id="pageCount"></span><span class="footerRight" id="pageNumber">Page 6 of 12</span>
                </div>
            </div>
        </section>
        <!-- Page 7 -->
        <section size="A4">
            <span class="horizontalMargins">
                <span class="content">
                    <table style="margin-top: 5pt">
                        <thead>
                            <colgroup>
                                <col width="70%" />
                                <col width="15%" />
                                <col width="15%" />
                            </colgroup>
                            <tr>
                                <th colspan="3" style="border:1px solid #000; background-color: #d3d3d3;">
                                    <div class="bold">Calculation 3:</div>
                                    <div style="font-weight: normal">The pension plan is wound up, the Plan Member is included in the wind up group and the effective date of the wind up is
                                        <span class="bold">on or before</span> the family law valuation date.</div>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="radio">
                                <td style="height:0">Commuted value of the pension benefit (including any ancillary benefits)
                                    as of the wind up date</td>
                                <td style="height:0">&nbsp;&nbsp;$<input type="text" style="width:55pt" value="${page7Step1Commuted}"/></td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= X</span></td>

                            </tr>
                            <tr class="radio">
                                <td style="height:0">Plus, accumulated interest from the wind up date to the family
                                    law valuation date</td>
                                <td style="height:0">&nbsp;&nbsp;$<input type="text" style="width:55pt" value="${page7Step1Accumulated}"/></td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= Y</span></td>

                            </tr>
                            <tr class="radio">
                                <td style="height:0">Initial preliminary value <span class="bold">(X + Y)</span></td>
                                <td style="height:0">&nbsp;&nbsp;$<input type="text" style="width:55pt" value="${page7Step1Initial}"/></td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= G</span></td>
                            </tr>
                            <tr class="radio">
                                <td style="height:0">Plus, surplus assets payable, if applicable (0 if not applicable or unknown)</td>
                                <td style="height:0">&nbsp;&nbsp;$<input type="text" style="width:55pt" value="${page7Step1Plus}"/></td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= surplus</span></td>
                            </tr>
                            <tr class="radio">
                                <td style="height:0"><span class="bold">Preliminary value as of the family law valuation date</span></td>
                                <td style="height:0">&nbsp;&nbsp;$<input type="text" style="width:55pt" value="${page7Step1Preliminary}"/></td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= G + surplus</span></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="greySection bold" style="margin-top: 40pt">Step 2 – Calculation of Family Law Value</div>
                    <p><span class="bold">
                        Note:
                    </span> The family law value is the portion of the preliminary value that accrued during the spousal relationship (married or
                        common-law) as of the family law valuation date. </p>
                    <table style="margin-top: 0">
                        <thead>
                            <colgroup>
                                <col width="70%" />
                                <col width="15%" />
                                <col width="15%" />
                            </colgroup>
                        </thead>
                        <tbody>
                            <tr class="radio">
                                <td style="height:0">The preliminary value calculated under <span class="bold">Step 1</span> above</td>
                                <td style="height:0">&nbsp;&nbsp;$<input type="text" style="width:55pt" value="${page7Step2Preliminary}"/></td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= (G + surplus)</span></td>

                            </tr>
                            <tr class="radio">
                                <td style="height:0">Total credited service accrued by the Plan Member during the spousal
                                    relationship period (i.e., beginning on the starting date and ending on the family
                                    law valuation date) </td>
                                <td style="height:0">&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width:55pt" value="${page7Step2Spousal}"/></td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= H</span></td>

                            </tr>
                            <tr class="radio">
                                <td style="height:0">Total credited service accrued by the Plan Member during the entire period of
                                    employment or plan membership as of the family law valuation date</span></td>
                                <td style="height:0">&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width:55pt" value="${page7Step2Member}"/></td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= J</span></td>
                            </tr>
                            <tr class="radio">
                                <td style="height:0">Family law value formula =<span class="bold"> (G + surplus) x H/J</span>
                                    (Note: H/J cannot exceed 1.)</td>
                                <td style="height:0">&nbsp;&nbsp;$<input type="text" style="width:55pt" value="${page7Step2FamilyLaw}"/></td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= family law
                                    value</span></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="greySection bold" style="margin-top: 40pt">Step 3 - Maximum Amount that May Be Transferred to the Plan Member’s Spouse</div>
                    <p>
                        The portion of the family law value payable to the Plan Member’s spouse
                        <span class="bold">cannot exceed 50% of the family law value</span> calculated under <span class="bold">Step 2</span> above.
                    </p>
                    <table style="margin-top: 0">
                        <thead>
                            <colgroup>
                                <col width="80%" />
                                <col width="20%" />
                            </colgroup>
                        </thead>
                        <tbody>
                            <tr class="radio">
                                <td style="height:0">
                                    The <span class="bold">maximum amount</span> of the family law value that may be transferred as equalization to the
                                    Plan Member’s spouse from the pension plan is:</td>
                                <td style="height:0">&nbsp;&nbsp;$<input type="text" style="width:86pt" value="${page7Step3Max}"/></td>

                            </tr>
                        </tbody>
                    </table>
                </span>
            </span>
            <div class="pageFooter">
                <div class="footerBottom">
                    <span class="footerLeft">PF-131E (2022)</span>
                    <span>© Queen''s Printer for Ontario</span>
                    <span class="footerRight" id="pageCount"></span><span class="footerRight" id="pageNumber">Page 7 of 12</span>
                </div>
            </div>
        </section>
        <!-- Page 8 -->
        <section size="A4">
            <span class="horizontalMargins">
                <span class="header"style="height: 8mm;">
                    <span class="leftHeader" style="width:68%"> </span>
                    <span class="rightHeader" style="width:55mm">
                        <div>Additional Disclosures</div>
                    </span>
                </span>
                <span class="content">
                    <table style="margin-top: 0">
                        <thead>
                            <colgroup>
                                <col width="60%" />
                                <col width="20%" />
                                <col width="20%" />
                            </colgroup>
                        </thead>
                        <tbody>
                            <tr class="radio">
                                <td style="height:0" colspan="3"><span class="bold">Plan Membership and Employment Information as of the Family Law Valuation Date</span></td>
                            </tr>
                            <tr class="radio">
                                <td colspan="3">The Plan Member joined the pension plan on (yyyy/mm/dd):&nbsp;&nbsp;<input type="text" style="width:80pt" value="${page8JoinedDate}"/></td>

                            </tr>
                            <tr class="radio">
                                <td style="border-right:0">The Plan Member became a former member (deferred vested) after
                                    the family law valuation date on (yyyy/mm/dd)</td>
                                <td style="border-left:0; border-right:0"><input type="text" style="width:80pt" value="${page8FormerDate}"/></td>
                                <td style="border-left:0"><label class="container"
                                    >not applicable
                                    <#if page8FormerDateNA==true>
                                    <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                    <#else>
                                    <span class="checkmark"><input type="checkbox"/></span>
                                    </#if>
                                </label></td>

                            </tr>
                            <tr class="radio">
                                <td style="border-right:0">The Plan Member became a retired member after the family law
                                    valuation date on (yyyy/mm/dd)</td>
                                <td style="border-left:0; border-right:0"><input type="text" style="width:80pt" value="${page8RetiredDate}"/></td>
                                <td style="border-left:0"><label class="container"
                                    >not applicable
                                    <#if page8RetiredDateNA==true>
                                    <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                    <#else>
                                    <span class="checkmark"><input type="checkbox"/></span>
                                    </#if>
                                </label></td>

                            </tr>
                        </tbody>
                    </table>
                    <table style="margin-top: 10pt">
                        <thead>
                            <colgroup>
                                <col width="40%" />
                                <col width="37.5%" />
                                <col width="22.5%" />
                            </colgroup>
                        </thead>
                        <tbody>
                            <tr class="radio">
                                <td style="height:0" colspan="3"><span class="bold">Information about the Plan Member’s Accrued Pension as of the Family Law Valuation Date for
                                    <br>Calculations 1 and 2</span></td>
                            </tr>
                            <tr class="radio">
                                <td style="border-right:0">Pensionable/average annual salary
                                    (if required for the pension formula)</td>
                                <td style="border-left:0; border-right:0">
                                    <label class="container">
                                    not applicable
                                    <#if page8Calc1And2PensionableNA==true>
                                    <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                    <#else>
                                    <span class="checkmark"><input type="checkbox"/></span>
                                    </#if>
                                </label></td>
                                <td style="border-left:0">$<input type="text" style="width:99pt" value="${page8Calc1And2Pensionable}"/></td>
                            </tr>
                            <tr class="radio">
                                <td style="border-right:0">Accrued lifetime pension as of the family law
                                    valuation date</td>
                                    <td style="border-left:0; border-right:0">
                                        <label class="container">
                                        monthly
                                        <#if page8Calc1And2LifetimeMonthly==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                    <label class="container">
                                        annual
                                        <#if page8Calc1And2LifetimeAnnual==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label></td>
                                <td style="border-left:0">$<input type="text" style="width:99pt" value="${page8Calc1And2Lifetime}"/></td>
                            </tr>
                            <tr class="radio">
                                <td style="border-right:0">Accrued bridging/supplemental benefit as of
                                    the family law valuation date </td>
                                    <td style="border-left:0; border-right:0">
                                        <label class="container">
                                        monthly
                                        <#if page8Calc1And2BridgingMonthly==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                    <label class="container">
                                        annual
                                        <#if page8Calc1And2BridgingAnnual==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                    <label class="container">
                                        not applicable
                                        <#if page8Calc1And2BridgingNA==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label></td>
                                <td style="border-left:0">$<input type="text" style="width:99pt" value="${page8Calc1And2Bridging}"/></td>
                            </tr>
                            <tr class="radio">
                                <td style="border-right:0">Canada Pension Plan reduction at age 65</td>
                                    <td style="height:0; border-left:0; border-right:0">
                                        <label class="container">
                                        monthly
                                        <#if page8Calc1And2ReductionMonthly==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                    <label class="container">
                                        annual
                                        <#if page8Calc1And2ReductionAnnual==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                    <label class="container">
                                        not applicable
                                        <#if page8Calc1And2ReductionNA==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label></td>
                                <td style="border-left:0">$<input type="text" style="width:99pt" value="${page8Calc1And2Reduction}"/></td>
                            </tr>
                             <tr class="radio">
                                <td style="border-right:0" colspan="2">Plan Member’s age on the family law valuation date</td>
                                <td style="border-left:0">&nbsp;&nbsp;<input type="text" style="width:99pt" value="${page8Calc1And2Valuation}"/></td>
                            </tr>
                            <tr class="radio">
                                <td style="border-right:0">Purchased pension credits (buybacks or
                                    transfers) are included in the preliminary value </td>
                                    <td style="border-left:0; border-right:0">
                                        <label class="container">
                                        yes
                                        <#if page8Calc1And2CreditsYes==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                    <label class="container">
                                        no
                                        <#if page8Calc1And2CreditsNo==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                    <label class="container">
                                        not applicable
                                        <#if page8Calc1And2CreditsNA==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label></td>
                                <td style="border-left:0"></td>
                            </tr>
                        </tbody>
                    </table>
                    <table style="margin-top: 10pt">
                        <thead>
                            <colgroup>
                                <col width="40%" />
                                <col width="37.5%" />
                                <col width="22.5%" />
                            </colgroup>
                        </thead>
                        <tbody>
                            <tr class="radio">
                                <td style="height:0" colspan="3"><span class="bold">Information about the Plan Member’s Accrued Pension as of the Wind Up Date for Calculation 3</span></td>
                            </tr>
                            <tr class="radio">
                                <td style="border-right:0">Pensionable/average annual salary
                                    (if required for the pension formula)</td>
                                <td style="border-left:0; border-right:0">
                                    <label class="container">
                                    not applicable
                                    <#if page8Calc3PensionableNA==true>
                                    <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                    <#else>
                                    <span class="checkmark"><input type="checkbox"/></span>
                                    </#if>
                                </label></td>
                                <td style="border-left:0">$<input type="text" style="width:99pt" value="${page8Calc3Pensionable}"/></td>
                            </tr>
                            <tr class="radio">
                                <td style="border-right:0">Accrued lifetime pension as of the  wind up date</td>
                                    <td style="border-left:0; border-right:0">
                                        <label class="container">
                                        monthly
                                        <#if page8Calc3LifetimeMonthly==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                    <label class="container">
                                        annual
                                        <#if page8Calc3LifetimeAnnual==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label></td>
                                <td style="border-left:0">$<input type="text" style="width:99pt" value="${page8Calc3Lifetime}"/></td>
                            </tr>
                            <tr class="radio">
                                <td style="border-right:0">Accrued bridging/supplemental benefits as of the wind up date</td>
                                    <td style="border-left:0; border-right:0">
                                        <label class="container">
                                        monthly
                                        <#if page8Calc3BridgingMonthly==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                    <label class="container">
                                        annual
                                        <#if page8Calc3BridgingAnnual==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                    <label class="container">
                                        not applicable
                                        <#if page8Calc3BridgingNA==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label></td>
                                <td style="border-left:0">$<input type="text" style="width:99pt" value="${page8Calc3Bridging}"/></td>
                            </tr>
                            <tr class="radio">
                                <td style="border-right:0">Canada Pension Plan reduction at age 65</td>
                                    <td style="height:0; border-left:0; border-right:0">
                                        <label class="container">
                                        monthly
                                        <#if page8Calc3ReductionMonthly==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                    <label class="container">
                                        annual
                                        <#if page8Calc3ReductionAnnual==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                    <label class="container">
                                        not applicable
                                        <#if page8Calc3ReductionNA==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label></td>
                                <td style="border-left:0">$<input type="text" style="width:99pt" value="${page8Calc3Reduction}"/></td>
                            </tr>
                             <tr class="radio">
                                <td style="border-right:0" colspan="2">Plan Member’s age on the wind up date</td>
                                <td style="border-left:0">&nbsp;&nbsp;<input type="text" style="width:99pt" value="${page8Calc3WindUp}"/></td>
                            </tr>
                            <tr class="radio">
                                <td style="border-right:0">Purchased pension credits (buybacks or
                                    transfers) are included in the preliminary value </td>
                                    <td style="border-left:0; border-right:0">
                                        <label class="container">
                                        yes
                                        <#if page8Calc3CreditsYes==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                    <label class="container">
                                        no
                                        <#if page8Calc3CreditsNo==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                    <label class="container">
                                        not applicable
                                        <#if page8Calc3CreditsNA==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label></td>
                                <td style="border-left:0"></td>
                            </tr>
                        </tbody>
                    </table>
                </span>
            </span>
            <div class="pageFooter">
                <div class="footerBottom">
                    <span class="footerLeft">PF-131E (2022)</span>
                    <span>© Queen''s Printer for Ontario</span>
                    <span class="footerRight" id="pageCount"></span><span class="footerRight" id="pageNumber">Page 8 of 12</span>
                </div>
            </div>
        </section>
        <!-- Page 9 -->
        <section size="A4">
            <span class="horizontalMargins">
                <span class="content">
                    <p class="bold">Explanation of Pension Plan Provisions that Apply to the Plan Member to Calculate the Family Law Value</p>
                    <label class="container">
                        Plan provisions are explained in a separate document that is included with this statement.
                        <#if page9Provisions==true>
                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                        <#else>
                        <span class="checkmark"><input type="checkbox"/></span>
                        </#if>
                    </label>
                    <span style="width: 100%;" class="underlineInput"></span>
                    <p>The following are details of the plan provisions (for example: benefit type, pension benefit formula, normal retirement
                        date, early retirement provision(s), normal form, ancillary benefit(s), indexation, etc.):</p>
                    <input type="textarea" style="height:400pt; width:189.6mm; text-align: top;" value="${page9Details}">
                </span>
            </span>
            <div class="pageFooter">
                <div class="footerBottom">
                    <span class="footerLeft">PF-131E (2022)</span>
                    <span>© Queen''s Printer for Ontario</span>
                    <span class="footerRight" id="pageCount"></span><span class="footerRight" id="pageNumber">Page 9 of 12</span>
                </div>
            </div>
        </section>
        <!-- Page 10 -->
        <section size="A4">
            <span class="horizontalMargins">
                <span class="content">
                    <div class="bold" style="margin-bottom:5pt">Actuarial Assumptions Used in the Calculation of the Preliminary Value</div>
                    <label class="container" style="margin-bottom:5pt">
                        Actuarial assumptions are provided in a separate document that is included with this statement.
                        <#if page10Actuarial==true>
                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                        <#else>
                        <span class="checkmark"><input type="checkbox"/></span>
                        </#if>
                    </label>
                    <table style="margin-top: 5pt">
                        <thead>
                            <colgroup>
                                <col width="50%" />
                                <col width="50%" />
                            </colgroup>
                            <tr>
                                <th style="border:1px solid #000; background-color: #d3d3d3; text-align:center; vertical-align: middle;">
                                    Assumptions based on section 3500 of the Canadian Institute of Actuaries Standards of Practice
                                </th>
                                <th style="border:1px solid #000; background-color: #d3d3d3; text-align:center; vertical-align: middle">
                                    Assumptions
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="radio">
                                <td style="height:60pt">Non-indexed interest rate(s)
                                </td>
                                <td><input type="textarea" style="height:60pt; width:265pt; text-align: top;" value="${page10NonIndex}"/>
                                </td>
                            </tr>
                            <tr class="radio">
                                <td style="height:60pt">Indexed interest rate(s)<br>
                                    <label class="container">
                                        not applicable
                                        <#if page10IndexNA==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                </td>
                                <td><input type="textarea" style="height:60pt; width:265pt; text-align: top;" value="${page10Index}"/></td>
                            </tr>
                            <tr class="radio">
                                <td style="height:60pt">Rate(s) of pension escalation<br>
                                    <label class="container">
                                        not applicable
                                        <#if page10RateNA==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                </td>
                                <td><input type="textarea" style="height:60pt; width:265pt; text-align: top;" value="${page10Rate}"/></td>
                                </tr>
                            <tr class="radio">
                                <td style="height:60pt">Mortality table:<br>
                                    <label class="container">
                                        Unisex (specify % male and % female) and/or
                                        <#if page10MortalityUnisex==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                    <br>
                                    <label class="container">
                                        Sex-distinct (pre-87 service only)
                                        <#if page10MortalitySex==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                </td>
                                <td><input type="textarea" style="height:60pt; width:265pt; text-align: top;" value="${page10Mortality}"/></td>
                            </tr>
                            <tr class="radio">
                                <td style="height:60pt">Marital status at retirement: percent married<br>
                                    <label class="container">
                                        not applicable
                                        <#if page10PercentNA==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                </td>
                                <td ><input type="textarea"style="height:60pt; width:265pt; text-align: top;" value="${page10Percent}"/></td>
                            </tr>
                            <tr class="radio">
                                <td style="height:60pt">Marital status at retirement: age difference
                                    between plan members and their spouses<br>
                                    <label class="container">
                                        not applicable
                                        <#if page10DifferenceNA==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                </td>
                                <td><input type="textarea" style="height:60pt; width:265pt; text-align: top;" value="${page10Difference}"/></td>
                            </tr>
                            <tr class="radio">
                                <td style="height:100p">Other relevant assumptions<br>
                                    <label class="container">
                                        not applicable
                                        <#if page10AssumptionNA==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                </td>
                                <td><input type="textarea" style="height:60pt; width:265pt; text-align: top;" value="${page10Assumption}"/></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="bold" style="margin-top:10pt; margin-bottom:5pt">Shortened Life Expectancy Information</div>
                    <label class="container" style="margin-bottom:5pt">
                        not applicable
                        <#if page10ShortenedNA==true>
                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                        <#else>
                        <span class="checkmark"><input type="checkbox"/></span>
                        </#if>
                    </label>
                    <table>
                        <tbody>
                            <tr>
                                <td>The Plan Member has filed a shortened life expectancy application and the conditions that are specified under section 12
                                    or 13 of Ontario Regulation 287/11 (Family Law Matters) apply. The following are the actuarial assumptions used in the
                                    calculation of the shortened life expectancy family law value:</td>
                            </tr>
                            <tr>
                                <td><input type="textarea" style="height:105pt; width:186.6mm; text-align: top;" value="${page10Shortened}"/></td>
                            </tr>
                        </tbody>
                    </table>
                </span>
            </span>
            <div class="pageFooter">
                <div class="footerBottom">
                    <span class="footerLeft">PF-131E (2022)</span>
                    <span>© Queen''s Printer for Ontario</span>
                    <span class="footerRight" id="pageCount"></span><span class="footerRight" id="pageNumber">Page 10 of 12</span>
                </div>
            </div>
        </section>
        <!-- Page 11 -->
        <section size="A4">
            <span class="horizontalMargins">
                <span class="content">
                    <div class="bold" style="margin-top:10pt; margin-bottom:5pt">Information about the wind up of the pension plan</div>
                    <label class="container" style="margin-bottom:5pt">
                        not applicable
                        <#if page11WindUpNA==true>
                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                        <#else>
                        <span class="checkmark"><input type="checkbox"/></span>
                        </#if>
                    </label>
                    <table>
                        <tbody style="vertical-align: middle;">
                            <tr>
                                <td colspan="2">The following information has been completed because the Plan Member is included in the wind up group. The effective
                                    date of the wind up is <span class="bold">on or before</span> the date of this statement.</td>
                            </tr>
                            <tr>
                                <td colspan="2">Effective date of the wind up of the pension plan is (yyyy/mm/dd):&nbsp;&nbsp;<input type="text" style="width:80pt" value="${page11WindUpDate}"/></td>
                            </tr>
                            <tr>
                                <td style="border-right:0">The Plan Member’s pension will be reduced as a result of the wind up</td>
                                    <td style="border-left:0">
                                        <label class="container">
                                        yes
                                        <#if page11WindUpYes==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                    <label class="container">
                                        no
                                        <#if page11WindUpNo==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                    <label class="container">
                                        unknown
                                        <#if page11WindUpUnknown==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label></td>
                            </tr>
                            <tr>
                                <td style="border-right:0">The pension plan is covered by the Pension Benefits Guarantee Fund</td>
                                    <td style="border-left:0">
                                        <label class="container">
                                        yes
                                        <#if page11GuaranteeYes==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                    <label class="container">
                                        no
                                        <#if page11GuaranteeNo==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="bold" style="margin-top:10pt; margin-bottom:5pt">Information about surplus application made on or before the family law valuation date</div>
                    <label class="container" style="margin-bottom:5pt">
                        not applicable
                        <#if page11ApplicationNA==true>
                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                        <#else>
                        <span class="checkmark"><input type="checkbox"/></span>
                        </#if>
                    </label>
                    <table>
                        <tbody>
                            <tr>
                                <td>The Plan Member is entitled to receive a share of surplus from the pension plan, which is not included in the family law
                                    value. The following is a summary of the relevant details of the surplus application (e.g., information about the surplus
                                    sharing agreement, etc.): </td>
                            </tr>
                            <tr>
                                <td><input type="textarea" style="height:145pt; width:186.6mm; text-align: top;" value="${page11Application}"/></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="bold" style="margin-top:20pt; margin-bottom:5pt">Information about pension plan amendments before the family law valuation date</div>
                    <label class="container" style="margin-bottom:5pt">
                        not applicable
                        <#if page11Ammendments==true>
                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                        <#else>
                        <span class="checkmark"><input type="checkbox"/></span>
                        </#if>
                    </label>
                    <table>
                        <thead>
                            <colgroup>
                                <col width="20%" />
                                <col width="80%" />
                            </colgroup>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="2">The Plan Member belongs to a class of employees that received (or will be receiving) payment(s) resulting from
                                    amendment(s) to the pension plan related to cost of living adjustments during the last three fiscal years of the pension
                                    plan before the family law valuation date. The following is an explanation of the amendment(s) [e.g., date when the
                                    amendment was made, how much the Plan Member received (or will receive), etc.]. </td>
                            </tr>
                            <tr>
                                <td style="border-right:0; vertical-align: middle; padding-left:10pt"><span class="bold">Year 1</span></td>
                                <td style="border-left:0"><input type="textarea" style="height:60pt; width:418pt; text-align: top;" value="${page11Year1}"/></td>
                            </tr>
                            <tr>
                                <td style="border-right:0; vertical-align: middle; padding-left:10pt"><span class="bold">Year 2</span></td>
                                <td style="border-left:0"><input type="textarea" style="height:60pt; width:418pt; text-align: top;" value="${page11Year2}"/></td>
                            </tr>
                            <tr>
                                <td style="border-right:0; vertical-align: middle; padding-left:10pt"><span class="bold">Year 3</span></td>
                                <td style="border-left:0"><input type="textarea" style="height:60pt; width:418pt; text-align: top;" value="${page11Year3}"/></td>
                            </tr>
                        </tbody>
                    </table>
                </span>
            </span>
            <div class="pageFooter">
                <div class="footerBottom">
                    <span class="footerLeft">PF-131E (2022)</span>
                    <span>© Queen''s Printer for Ontario</span>
                    <span class="footerRight" id="pageCount"></span><span class="footerRight" id="pageNumber">Page 11 of 12</span>
                </div>
            </div>
        </section>
        <!-- Page 12 -->
        <section size="A4">
            <span class="horizontalMargins">
                <span class="content">
                    <div class="bold" style="margin-top:10pt; margin-bottom:5pt">Information about additional voluntary contributions (AVCs) as of the family law valuation date</div>
                    <label class="container" style="margin-bottom:5pt">
                        not applicable
                        <#if page12AVCNA==true>
                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                        <#else>
                        <span class="checkmark"><input type="checkbox"/></span>
                        </#if>
                    </label>
                    <table>
                        <thead>
                            <colgroup>
                                <col width="77%" />
                                <col width="23%" />
                            </colgroup>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="2">AVCs are voluntary contributions that a Plan Member may make beyond those that are required to be made by the Plan
                                    Member under the pension plan. The terms of the pension plan specify whether AVCs are allowed and how they are to
                                    be paid out. AVCs are <span class="bold">not included</span> in the family law value set out in <span class="bold">Part A</span> of this statement.</td>
                            </tr>
                            <tr>
                                <td style="border-right:0; height:30pt; vertical-align: middle">The total AVCs as of the family law valuation date, including interest/investment earnings:</td>
                                <td style="border-left:0; height:30pt; vertical-align: middle">$<input type="textarea" style="width:99pt" value="${page12Family}"/></td>
                            </tr>
                            <tr>
                                <td style="border-right:0; height:30pt; vertical-align: middle">The total AVCs from the starting date of the spousal relationship to the family law valuation date,
                                    including interest/investment earnings (provided if available):</td>
                                <td style="border-left:0; height:30pt; vertical-align: middle">$<input type="textarea" style="width:99pt" value="${page12Spousal}"/></td>
                            </tr>
                        </tbody>
                    </table>
                </span>
            </span>
            <div class="pageFooter">
                <div class="footerBottom">
                    <span class="footerLeft">PF-131E (2022)</span>
                    <span>© Queen''s Printer for Ontario</span>
                    <span class="footerRight" id="pageCount"></span><span class="footerRight" id="pageNumber">Page 12 of 12</span>
                </div>
            </div>
        </section>
    </body>

</html>', true, 1, 'dms_template', current_timestamp);



insert into dmstemplate.template_history (audit_id,template_id, process_id, template_name, template_type, approved_by, modified_by,
                                  modified_on, template_fields, template_data, is_active, version, created_by,
                                  created_on)
values ('076af283-7472-472c-9d31-f512f7fb041e','6ffd6a5a-198e-11ed-861d-0242ac120003', 'SAD', 'FLV_FamilyLawForm4D_Template', 'HTML', '', 'dms_template',
        current_timestamp, '[
        {
            "defaultValue": "",
            "fieldName": "page1NameOfMemberLastName",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page1NameOfMemberFirstName",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page1NameOfMemberInitials",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page1NameOfMemberYes",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page1NameOfMemberNo",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },

        {
            "defaultValue": "",
            "fieldName": "page1NameOfSpouseLastName",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page1NameOfSpouseFirstName",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page1NameOfSpouseInitials",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page1NameOfSpouseYes",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page1NameOfSpouseNo",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page1TwoValidationsYes",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page1TwoValidationsNo",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page1SpousalDate",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page1MarriageDate",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page1Together",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page1Joint",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page1Arbitration",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page1FamilyLawDate",
            "fieldType": "STRING",
            "isRequired": false
        },

		  {
            "defaultValue": false,
            "fieldName": "page2DefinedContributionBenefitNA",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
		{
		"defaultValue": false,
            "fieldName": "page2DefinedBenefit",
            "fieldType": "STRING",
            "isRequired": false
		},
		{
		"defaultValue": false,
            "fieldName": "page2DefinedContributionBenefit",
            "fieldType": "STRING",
            "isRequired": false
		},
        {
            "defaultValue": "",
            "fieldName": "page2FamilyLawValue",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2MaximumAmount",
            "fieldType": "STRING",
            "isRequired": false
        },

        {
            "defaultValue": "",
            "fieldName": "page2NameOfPension",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2RegistrationNumber",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2Employer",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2Admin",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2Unit",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2StreetNumber",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2StreetName",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2City",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2Province",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2Country",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2Postal",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2Telephone",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2Fax",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2Email",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2PlanMemberLastName",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2PlanMemberFirstName",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2PlanMemberInitials",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2PlanMemberDate",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2PlanMemberEmployee",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2PlanMemberSpouseLastName",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2PlanMemberSpouseFirstName",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2PlanMemberSpouseInitials",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page2PlanMemberSpouseDate",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page3TransferLocked",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page3TransferAnother",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page3NoTransfer",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page3NoTransferApplication",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page3TransferRatio",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page3NameOfPlan",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page3Signature",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page3Date",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page3NameOfFirm",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page3Unit",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page3StreetNumber",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page3StreetName",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page3City",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page3Province",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page3Country",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page3Postal",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page3Telephone",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page3Fax",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page3Email",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page5OnOrBefore",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page5After",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page5WoundUp",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },

        {
            "defaultValue": "",
            "fieldName": "page5Initial",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page5Plus",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page5Preliminary",
            "fieldType": "STRING",
            "isRequired": false
        },
		 {
            "defaultValue": false,
            "fieldName": "page6OnOrBefore",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
		 {
            "defaultValue": false,
            "fieldName": "page6After",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },

        {
            "defaultValue": "",
            "fieldName": "page6DefinedContributionIncludeAccount",
            "fieldType": "STRING",
            "isRequired": false
        },
		{
            "defaultValue": "",
            "fieldName": "page6DefinedContributionNotIncludeAccount",
            "fieldType": "STRING",
            "isRequired": false
        },


        {
            "defaultValue": "",
            "fieldName": "page6Step1Commuted",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page6Step1Accumulated",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page6Step1Initial",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page6Step1Plus",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page6Step1Preliminary",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page7Step2Preliminary",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page7Step2Spousal",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page7Step2Member",
            "fieldType": "STRING",
            "isRequired": false
        },

        {
            "defaultValue": "",
            "fieldName": "page7Step2FamilyLaw",
            "fieldType": "STRING",
            "isRequired": false
        },


		{
            "defaultValue": "",
            "fieldName": "page7FamilyLawValue",
            "fieldType": "STRING",
            "isRequired": false
        },

		{
            "defaultValue": "",
            "fieldName": "page7Calc5aDefinedBenefit",
            "fieldType": "STRING",
            "isRequired": false
        },
		{
            "defaultValue": "",
            "fieldName": "page7Calc5aAccountBalance",
            "fieldType": "STRING",
            "isRequired": false
        },
		{
            "defaultValue": "",
            "fieldName": "page7Calculation5aFlvbenefit",
            "fieldType": "STRING",
            "isRequired": false
        },
		{
            "defaultValue": "",
            "fieldName": "page8AsOFAccountDeterminationDate",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page8Calc5bPreliminaryValue",
            "fieldType": "STRING",
            "isRequired": false
        },
		{
            "defaultValue": "",
            "fieldName": "page8Calc5bFamilyLaw",
            "fieldType": "STRING",
            "isRequired": false
        },
		{
            "defaultValue": "",
            "fieldName": "page8Calc5cPeriodOfSpousalRelation",
            "fieldType": "STRING",
            "isRequired": false
        },
		{
            "defaultValue": "",
            "fieldName": "page8Calc5cPreliminaryValue",
            "fieldType": "STRING",
            "isRequired": false
        },
		{
            "defaultValue": "",
            "fieldName": "page8Calc5cEntirePeridOfEmployment",
            "fieldType": "STRING",
            "isRequired": false
        },
		{
            "defaultValue": "",
            "fieldName": "page8Calc5cFamilyLawValue",
            "fieldType": "STRING",
            "isRequired": false
        },
		{
            "defaultValue": "",
            "fieldName": "page8TotalFlv",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page9JoinedDate",
            "fieldType": "STRING",
            "isRequired": false
        },

        {
            "defaultValue": "",
            "fieldName": "page9TerminationDate",
            "fieldType": "STRING",
            "isRequired": false
        },
		{
            "defaultValue": false,
            "fieldName": "page9FlvDateNA",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },

        {
            "defaultValue": "",
            "fieldName": "page9Calc1And2Lifetime",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page9Calc1And2LifetimeMonthly",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page9Calc1And2LifetimeAnnual",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page9Calc1And2Bridging",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page9Calc1And2BridgingMonthly",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page9Calc1And2BridgingAnnual",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page9Calc1And2BridgingNA",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page9Calc1And2Reduction",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page9Calc1And2ReductionMonthly",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page9Calc1And2ReductionAnnual",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page9Calc1And2ReductionNA",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page9Calc1And2Valuation",
            "fieldType": "STRING",
            "isRequired": false
        },



        {
            "defaultValue": "",
            "fieldName": "page9Calc3Lifetime",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page9Calc3LifetimeMonthly",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page9Calc3LifetimeAnnual",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page9Calc3Bridging",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page9Calc3BridgingMonthly",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page9Calc3BridgingAnnual",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page9Calc3BridgingNA",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page9Calc3Reduction",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page9Calc3ReductionMonthly",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page9Calc3ReductionAnnual",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page9Calc3ReductionNA",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page9Calc3WindUp",
            "fieldType": "STRING",
            "isRequired": false
        },

        {
            "defaultValue": false,
            "fieldName": "page10Provisions",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },


		{
            "defaultValue": "",
            "fieldName": "page9FlvDate",
            "fieldType": "STRING",
            "isRequired": false
        },




		{
            "defaultValue": "",
            "fieldName": "page9Details",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page11Actuarial",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page11NonIndex",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page11Index",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page11IndexNA",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page11Rate",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page11RateNA",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page11Mortality",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page11MortalityUnisex",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },

        {
            "defaultValue": false,
            "fieldName": "page11MortalitySex",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page11Percent",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page11PercentNA",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page11Difference",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page11DifferenceNA",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page11Assumption",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page11AssumptionNA",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page11Shortened",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page11ShortenedNA",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page12WindUpNA",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page12WindUpDate",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page12WindUpYes",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },

        {
            "defaultValue": false,
            "fieldName": "page12WindUpNo",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page12WindUpUnknown",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page12GuaranteeYes",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page12GuaranteeNo",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page12Application",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page12ApplicationNA",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page12Ammendments",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page12Year1",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page12Year2",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page12Year3",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "page13AVCNA",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page13Family",
            "fieldType": "STRING",
            "isRequired": false
        },
        {
            "defaultValue": "",
            "fieldName": "page13Spousal",
            "fieldType": "STRING",
            "isRequired": false
        }

    ]',
        '<!DOCTYPE html>

<html>
    <head>
        <style type="text/css">
            @page {
                size: 215.9mm 279.4mm;
                margin: 0 0 0 0 !important;
                padding-top: 0 !important;
            }
            @media print {
                body,
                section[size="A4"] {
                    size: 215.9mm 279.4mm;
                    padding: 0;
                    margin: 0;
                    box-shadow: 0;
                }
                .content {
                    display: block;
                    overflow: hidden;
                    width: 189.6mm;
                }
            }
            @media screen {
                body {
                    background: rgb(204, 204, 204);
                }
                section {
                    background: white;
                    box-shadow: 0 0 0.5cm rgba(0, 0, 0, 0.5);
                }
                section > .horizontalMargins {
                    padding: 10.9mm 0 14.5mm 0 !important;
                }
            }
            body {
                margin-left: auto;
                margin-right: auto;
            }
            section {
                display: block;
                margin: 0 auto;
                margin-bottom: 0.5cm;
            }
            section[size="A4"] {
                width: 215.9mm;
                height: 279.4mm;
                position:relative;
            }
            section > .horizontalMargins {
                margin: 0mm 13.15mm 0mm 13.15mm;
                max-width: 100%;
                display: block;
                padding: 10.9mm 0 14.5mm 0 !important;
            }
            thead > tr > th {
                font-weight: bold;
                margin-top: 15px;
                display: block;
            }
            tbody > tr > td {
                padding: 2pt;
                border: 1px solid black;
                height: 45px;
            }
            tbody {
                vertical-align: top;
            }
            table {
                border-spacing: 0;
                border-collapse: collapse;
                width: 100%;
                text-align: left;
            }
            .content {
                font-size: 10pt;
                font-family: Arial, Helvetica, sans-serif;
            }
            .marginTop0 {
                margin-top: 0px;
            }

            .marginBottom0 {
                margin-bottom: 0px;
            }
            .h3Style {
                margin-bottom: 0px;
                margin-left: 15px;
            }
            .inlineBlock {
                display: inline-block;
            }
            .spanLeftMarginRight {
                float: left;
                margin-right: 20px;
            }
            .spanLeft {
                float: left;
            }
            .bold {
                font-weight: bold;
            }
            .row {
                margin-top: 10px;
            }
            .headerRight hr {
                width: 225px !important;
            }
            .greySection {
                margin-top: 10px;
                font-size: 11pt;
                padding: 5px;
                margin-left: -1px;
                background-color: #d3d3d3;
            }
            .radio {
                vertical-align: middle;
            }
            .underlineInput {
                border-bottom: 1px solid black;
                width: 80pt;
                display: inline-block;
            }
            .horizontalLine {
                display: block;
                margin-top: -10pt;
                width: 100%;
                border-top: 1px solid black;
                margin-bottom: 10pt;
            }
            .pPadding {
                margin-top: 5px;
                margin-bottom: 5px;
            }
            .container {
                display: inline-block;
                position: relative;
                padding-left: 17px;
                cursor: pointer;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
            }
            .checkmark {
                position: absolute;
                top: 0;
                left: 0;
            }
            .header {
                display: block;
                padding-bottom: 7mm;
                width: 100%;
            }
            .leftHeader {
                display: inline-block;
                border-right: 1px solid black;
                height: 100%;
                width: 37%;
            }
            .rightHeader {
                font-family: Arial, Helvetica, sans-serif;
                display: inline-block;
                padding-left: 3mm;
                height: 100%;
                vertical-align: top;
                font-size: 14pt;
                font-weight: bold;
                width: 115mm;
            }
            .rightHeader > .subHeading {
                padding-top: 3mm;
                font-size: 9pt;
                font-weight: normal;
            }
            .page-break {
                display: block;
                page-break-after: always;
            }
            .footerBottom {
                margin-top: 10px;
                text-align: center;
            }
            .footerLeft {
                float: left;
                text-align: left;
            }
            .footerRight {
                float: right;
                text-align: right;
            }
            .pageFooter {
                font-family: Arial, Helvetica, sans-serif;
                font-size: 10px;
                bottom:20pt;
                position:absolute;
                border-top:1px solid #000;
                width:189.6mm;
                margin-left:13.15mm;
                margin-right:13.15mm;
            }
        </style>
    </head>
    <body>
        <!-- Page 1 -->
        <section size="A4">
            <span class="horizontalMargins" style="padding: 10.9mm 0 14.5mm 0 !important">
                <span class="header" style="height: 25mm;">
                    <span class="leftHeader"><span style="display:table-cell"><img src="FSRA_LOGO" width="150" style="vertical-align:top; padding-top:5pt"/>
                        <img src="FSRA_ONTARIO_LOGO" style="padding-left:15pt; vertical-align:top; padding-top:5pt" width="50"/>
                    </span>
                    </span>
                    <span class="rightHeader">
                        <div>Statement of Family Law Value</div>
                        <div>Former Plan Member</div>
                        <div>Family Law Form FL–4D</div>
                        <div class="subHeading">(Under section 67.2(9) of the Pension Benefits Act)</div>
                    </span>
                </span>
                <span class="content">
				<div class = "pPadding">This statement provides the imputed value under the Pension Benefits Act and Family Law Act for a Former Member on the family law valuation date (e.g.,separation date). The pension plan provides a:</p>
				<ul>
				<li>a defined benefit; or</li>
				<li>a separate defined benefit and a defined contribution benefit.</li>
				</ul>
				</div>
                    <div class="pPadding">
                         This statement is completed by the plan administrator.
						The plan administrator is required to provide this statement to both the Former Member and the Former Member’s spouse, regardless of who makes the application.
                    </div>
                    <div class="pPadding">
                        The imputed value (referred to as <span class="bold">family law value</span> on this statement)
                        is the value of the pension benefit that was accrued during the spousal relationship. It is
                        calculated as of the family law valuation date. The family law value is used in the calculation
                        of the Former Member’s net family property. This statement does not entitle the Former Member’s
                        spouse to a portion of the pension benefit.
                    </div>
                    <div class="pPadding">
                        This statement includes details of how the family law value was calculated. If you have
                        questions about the calculations, contact the plan administrator.
                    </div>
                    <div class="pPadding">
                        Information about the pension valuation and division process can be found in the
                        <a
                            href="https://www.fsrao.ca/consumers/pensions/pensions-and-marriage-breakdown-guide-members-and-their-spouses"
                        >
                            Pensions and Marriage Breakdown – a Guide for Members and their Spouses</a
                        >.
                    </div>
                    <div class="greySection bold">Part A – Family Law Value</div>
                    <table>
                        <thead>
                            <tr>
                                <th colspan="''4">Name of Former Member</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td style="width: 34%; border-left: 0">Last Name<br>
                                ${page1NameOfMemberLastName}</td>
                                <td style="width: 34%">First Name<br>
                                    ${page1NameOfMemberFirstName}</td>
                                <td style="width: 6%">Initials<br>
                                    ${page1NameOfMemberInitials}</td>
                                <td style="border-right: 0" class="radio">
                                    Applicant
                                    <span style="margin-left: 10px">

                                        <label class="container"
                                            >Yes
                                            <#if page1NameOfMemberYes==true>
                                            <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                            <#else>
                                            <span class="checkmark"><input type="checkbox"/></span>
                                            </#if>
                                        </label>
                                        <label class="container"
                                            >No
                                            <#if page1NameOfMemberNo==true>
                                            <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                            <#else>
                                            <span class="checkmark"><input type="checkbox"/></span>
                                            </#if>
                                        </label>
                                    </span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table>
                        <thead>
                            <tr>
                                <th colspan="''4">Name of Former Member’s Spouse</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td style="width: 34%; border-left: 0">Last Name<br>
                                   ${page1NameOfSpouseLastName}</td>
                                <td style="width: 34%">First Name<br>
                                   ${page1NameOfSpouseFirstName}</td>
                                <td style="width: 6%">Initials<br>
                                   ${page1NameOfSpouseInitials}</td>
                                <td style="border-right: 0" class="radio">
                                    Applicant
                                    <span style="margin-left: 10px">
                                        <label class="container"
                                            >Yes
                                            <#if page1NameOfSpouseYes==true>
                                            <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                            <#else>
                                            <span class="checkmark"><input type="checkbox"/></span>
                                            </#if>
                                        </label>
                                        <label class="container"
                                            >No
                                            <#if page1NameOfSpouseNo==true>
                                            <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                            <#else>
                                            <span class="checkmark"><input type="checkbox"/></span>
                                            </#if>
                                        </label>
                                    </span>
                                </td>
                            </tr>
                                <td colspan="4" style="height: 0; border-right: 0; border-left: 0">
                                  <div style="width: 75.85%; display: table-cell">
                                        You and your spouse have proposed two valuation dates. The plan administrator
                                        will therefore provide two statements. This statement sets out ONE of the two
                                        proposed family law values.
                                    </div>
                                    <div style="display: table-cell; padding-left: 56px;" class="radio">
									  <span style="margin-left: 10px">
                                        <label class="container"
                                            >Yes
                                            <#if page1TwoValidationsYes==true>
                                            <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                            <#else>
                                            <span class="checkmark"><input type="checkbox"/></span>
                                            </#if>
                                        </label>
                                        <label class="container"
                                            >No
                                            <#if page1TwoValidationsNo==true>
                                            <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                            <#else>
                                            <span class="checkmark"><input type="checkbox"/></span>
                                            </#if>
                                        </label>
										</span>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div style="margin-top: 10px">
                        <span style="display: table-cell;">
                            The starting date of your spousal relationship is (yyyy/mm/dd): &nbsp;&nbsp;&nbsp;
                        <span class="underlineInput">${page1SpousalDate}</span></span>
                    </div>
                    <p style="margin-bottom: 3pt">The starting date is based on:</p>
                    <div style="margin-bottom: 3pt">
                        <label class="container"
                            >your marriage date
                            <#if page1MarriageDate==true>
                            <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                            <#else>
                            <span class="checkmark"><input type="checkbox"/></span>
                            </#if>
                        </label>
                    </div>
                    <div style="margin-top: 3pt; margin-bottom: 3pt">
                        <label class="container"
                            >the date when you and your spouse started living together in a common-law relationship
                            <#if page1Together==true>
                            <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                            <#else>
                            <span class="checkmark"><input type="checkbox"/></span>
                            </#if>
                        </label>
                    </div>
                    <div style="margin-top: 3pt; margin-bottom: 3pt">
                        <label class="container"
                            >the date that was jointly chosen by you and your spouse
                            <#if page1Joint==true>
                            <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                            <#else>
                            <span class="checkmark"><input type="checkbox"/></span>
                            </#if>
                        </label>
                    </div>
                    <div style="margin-top: 3pt">
                        <label class="container"
                            >the date specified in your court order or family arbitration award
                            <#if page1Arbitration==true>
                            <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                            <#else>
                            <span class="checkmark"><input type="checkbox"/></span>
                            </#if>
                        </label>
                    </div>
                    <p>
                        <span style="display: table-cell">
                            Your <span class="bold">family law valuation date</span> is (yyyy/mm/dd):
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <span class="underlineInput">${page1FamilyLawDate}</span></span>
                    </p>
					   </span>
            </span>
					<div class="pageFooter">
                <div class="footerBottom">
                    <span class="footerLeft">PF-134E (2021)</span>
                    <span>© Queen''s Printer for Ontario</span>
                    <span class="footerRight" id="pageCount"></span><span class="footerRight" id="pageNumber">Page 1 of 13</span>
                </div>
            </div>
        </section>

		<!-- Page 2 -->
        <section size="A4">
            <span class="horizontalMargins">
                <span class="content">
                    <p>
                        <span style="display: table-cell; width: 69%">
                            The <span class="bold">family law value</span> as of family law valuaion date is:
                        </span><br>
						<span style="display: table-cell">
                            <span style="display: table-cell">$</span>
                            <span style="display: table-cell" class="underlineInput">${page2DefinedBenefit}</span>
                            <span style="display: table-cell">&nbsp;&nbsp;(defined benefit)</span>
                        </span><br>

						<span style="display: table-cell">
                            <span style="display: table-cell">$</span>
                            <span style="display: table-cell" class="underlineInput">${page2DefinedContributionBenefit}</span>
                            <span style="display: table-cell">&nbsp;&nbsp;(defined contribution benefit)&nbsp;&nbsp;&nbsp;&nbsp;
							<span style="display: inline"></span>
							<label class="container"
                            >not applicable
							 <#if page2DefinedContributionBenefitNA==true>
                            <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                            <#else>
                            <span class="checkmark"><input type="checkbox"/></span>
                            </#if>
							</label>
							</span>
							</span>

                        </span><br>
                        <span style="display: table-cell">
                            <span style="display: table-cell">$</span>
                            <span style="display: table-cell" class="underlineInput">${page2FamilyLawValue}</span>
                            <span style="display: table-cell">&nbsp;&nbsp;GROSS</span>
                        </span>
                    </p>

                    <p>
                        <span style="display: table-cell; width: 50%">
                            The <span class="bold">maximum amount</span> that may be transferred as equalization to the
                            Former Member’s spouse is: &nbsp;
                        </span><br>
                        <span style="display: table-cell; vertical-align: middle; padding-left: 10pt">
                            <span style="display: table-cell">$</span>
                            <span style="display: table-cell" class="underlineInput">${page2MaximumAmount}</span>
                            <span style="display: table-cell">&nbsp;&nbsp;GROSS  (50% of the total family law value )</span>
                        </span>
                    </p><br>
					<p>
					 <div class="pPadding">
                        <span class= "bold">Note:</span> The Former Member should include the gross family law value as an asset on the Former Member’s financial
                        statement. The Former Member should also list future tax liability for the pension as a debt on the financial statement.
                        Consult a family law lawyer or financial advisor for advice on calculating the future tax rate. Neither the plan administrator
                        nor FSRA can provide assistance on determining the future tax liability, completing the financial statement or calculating
                        net family property.
                      </div>
					</p>
                    <span class="horizontalLine"></span>
					<br>
                    <span>
                        <span class="bold">IMPORTANT:</span>
                        <div>
                            See
                            <a
                                href="https://www.fsrao.ca/consumers/pensions/pensions-and-marriage-breakdown-guide-members-and-their-spouses"
                            >
                                Pensions and Marriage Breakdown – a Guide for Members and their Spouses
                            </a>
                            for treatment of interest.
                        </div>
                    </span><br>

                    <div class="greySection bold" style="margin-top: 0">Part B – Pension Plan Information</div>
                    <table>
                        <tbody>
                            <tr>
                                <td style="width: 70%; border-left: 0; border-top: 0">Name of Pension Plan<br>
                                    ${page2NameOfPension}</td>
                                <td style="width: 30%; border-right: 0; border-top: 0">Registration Number<br>
                                    ${page2RegistrationNumber}</td>
                            </tr>
                            <tr>
                                <td colspan="2" style="border-left: 0; border-right: 0">
                                    Name of Employer/Union/Professional Association<br>
                                    ${page2Employer}
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="width: 70%; border-left: 0; border-right: 0">
                                    Plan Administrator<br>
                                    ${page2Admin}
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table style="margin-top: 10pt">
                        <thead>
                            <colgroup>
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                            </colgroup>
                            <tr>
                                <th colspan="10">Plan Administrator’s Contact Information</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="2" style="border-left: 0">Unit Number<br>
                                    ${page2Unit}</td>
                                <td colspan="2">Street Number<br>
                                    ${page2StreetNumber}</td>
                                <td colspan="8" style="border-right: 0">Street Name<br>
                                    ${page2StreetName}</td>
                            </tr>
                            <tr>
                                <td colspan="3" style="border-left: 0">City<br>
                                    ${page2City}</td>
                                <td colspan="2">Province/State<br>
                                    ${page2Province}</td>
                                <td colspan="2">Country<br>
                                    ${page2Country}</td>
                                <td colspan="3" style="border-right: 0">Postal Code/Zip Code<br>
                                    ${page2Postal}</td>
                            </tr>
                            <tr>
                                <td colspan="2" style="border-left: 0">Telephone Number<br>
                                    ${page2Telephone}</td>
                                <td colspan="2">Fax Number<br>
                                    ${page2Fax}</td>
                                <td colspan="8" style="border-right: 0">E-mail Address<br>
                                    ${page2Email}</td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="greySection bold" style="margin-top: 20pt">
                        Part C – Information about the Former Member
                    </div>
                    <table>
                        <tbody>
                            <colgroup>
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                            </colgroup>
                            <tr>
                                <td colspan="5" style="border-left: 0; border-top: 0">Last Name<br>
                                    ${page2PlanMemberLastName}</td>
                                <td colspan="4" style="border-top: 0">First Name<br>
                                    ${page2PlanMemberFirstName}</td>
                                <td style="border-right: 0; border-top: 0">Initials<br>
                                    ${page2PlanMemberInitials}</td>
                            </tr>
                            <tr>
                                <td colspan="3" style="border-left: 0">Date of Birth (yyyy/mm/dd)<br>
                                    ${page2PlanMemberDate}</td>
                                <td colspan="7" style="border-right: 0">
                                    Employee/Pension Plan Identification Number, if applicable<br>
                                    ${page2PlanMemberEmployee}
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="greySection bold" style="margin-top: 20pt">
                        Part D – Information about the Former Member’s Spouse
                    </div>
                    <table>
                        <tbody>
                            <colgroup>
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                            </colgroup>
                            <tr>
                                <td colspan="3" style="border-left: 0; border-top: 0">Last Name<br>
                                    ${page2PlanMemberSpouseLastName}</td>
                                <td colspan="3" style="border-top: 0">First Name<br>
                                   ${page2PlanMemberSpouseFirstName}</td>
                                <td style="border-top: 0">Initials<br>
                                    ${page2PlanMemberSpouseInitials}</td>
                                <td colspan="3" style="border-right: 0; border-top: 0">Date of Birth (yyyy/mm/dd)<br>
                                    ${page2PlanMemberSpouseDate}</td>
                            </tr>
                        </tbody>
                    </table>
                </span>
            </span>
            <div class="pageFooter">
                <div class="footerBottom">
                    <span class="footerLeft">PF-134E (2021)</span>
                    <span>© Queen''s Printer for Ontario</span>
                    <span class="footerRight" id="pageCount"></span><span class="footerRight" id="pageNumber">Page 2 of 13</span>
                </div>
            </div>
        </section>
        <!-- Page 3 -->
        <section size="A4">
            <span class="horizontalMargins">
                <span class="content">
                    <div class="greySection bold" style="margin-top: 0">
                        Part E – Transfer Options for the Former Member’s Spouse
                    </div>
                    <div style="margin-top: 5pt">
                        If the Former Member is required to make an equalization payment, up to 50% of the family law value can be assigned to
						the Former Member’s spouse in a court order, family arbitration award or domestic contract. In that event, the following
						transfer options are available to the Former Member’s spouse:
						</div>
                    <div style="margin-top: 10pt">
                        <label class="container">
                            <#if page3TransferLocked==true>
                            <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                            <#else>
                            <span class="checkmark"><input type="checkbox"/></span>
                            </#if>
                            Transfer lump sum to a locked-in retirement account (LIRA) or to a life income fund (LIF).
                            (Note: The earliest date the Former Member’s spouse may buy a LIF is anytime during the
                            calendar year before the year they turn 55 years of age. Up to 50 per cent of the money that
                            is transferred into the LIF may be withdrawn within 60 days of transferring the money to the
                            LIF using FSRA’s
                            <span class="bold">
                                Form 5.2 – Application to withdraw or transfer up to 50% of the money transferred into a
                                Schedule 1.1 LIF.)
                            </span>
                        </label>
                    </div>
                    <div style="margin-top: 5pt">
                        <label class="container">
                            <#if page3TransferAnother==true>
                            <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                            <#else>
                            <span class="checkmark"><input type="checkbox"/></span>
                            </#if>
                            Transfer lump sum to another pension plan in any Canadian jurisdiction. This option will
                            only be available if the plan administrator of the receiving pension plan agrees to accept
                            the transfer and administer the transferred amount in accordance with the Ontario Pension
                            Benefits Act.
                        </label>
                    </div>
                    <div style="margin-top: 5pt">
                        <label class="container">
                            <#if page3NoTransfer==true>
                            <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                            <#else>
                            <span class="checkmark"><input type="checkbox"/></span>
                            </#if>
                            <span>No transfer options are available. This is because:</span>
                        </label>
                    </div>
                    <span style="width: 100%;height:55pt; width:189.6mm; text-align: top;" class="underlineInput">${page3NoTransferApplication}</span>
                    <div class="greySection bold" style="margin-top: 30pt">Part F – Pension Fund Status (Denefined Benefits)</div>
                    <div style="margin-top: 5px">
                        <span style="display: table-cell">
                            The <span class="bold">transfer ratio </span>of the pension plan for the purposes of this
                            statement is: &nbsp;&nbsp;
                        <span class="underlineInput" style="width:80pt">${page3TransferRatio}</span></span>
                    </div>

                    <p>
                        <span class="bold">Note: </span>The transfer ratio of a pension plan reflects the funded status
                        of the pension plan as of a specific date and may change. If the transfer ratio is less than 1.0
                        at the time of payment, there may be limits on the plan administrator’s ability to transfer the
                        entire family law value amount to the Former Member’s spouse. Any balance owing could be paid
                        within five years of the initial payment.
                    </p>
                    <div class="greySection bold" style="margin-top: 20pt">
                        Part G – Certification by the Plan Administrator
                    </div>
                    <div style="margin-top: 5px; margin-bottom: 5px">
                        I certify that this statement is accurate based on the information provided by the applicant in
                        their <span class="bold">Application for Family Law Value (Family Law Form FL–1)</span> and the
                        data contained in the pension plan records.
                    </div>
                    <table>
                        <tbody>
                            <tr>
                                <td
                                    colspan="2"
                                    style="border-left: 0; border-right: 0; border-top: 1px solid black"
                                >
                                    Name of plan administrator or plan administrator’s authorized agent or
                                    representative (printed)<br>
                                    ${page3NameOfPlan}
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 80%; border-left: 0; border-top: 0">
                                    Signature of plan administrator or plan administrator’s authorized agent or
                                    representative<br>
                                    ${page3Signature}
                                </td>
                                <td style="width: 20%; border-right: 0; border-top: 0">Date (yyyy/mm/dd)<br>
                                    ${page3Date}</td>
                            </tr>
                        </tbody>
                    </table>
                    <table style="margin-top: 10pt">
                        <thead>
                            <colgroup>
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                            </colgroup>
                            <tr>
                                <th colspan="10">
                                    Information about the plan administrator’s authorized agent or representative (if
                                    applicable)
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="10" style="border-left: 0; border-right: 0">Firm/Company Name<br>
                                    ${page3NameOfFirm}</td>
                            </tr>
                            <tr>
                                <td colspan="2" style="border-left: 0">Unit Number<br>
                                    ${page3Unit}</td>
                                <td colspan="2">Street Number<br>
                                    ${page3StreetNumber}</td>
                                <td colspan="8" style="border-right: 0">Street Name<br>
                                    ${page3StreetName}</td>
                            </tr>
                            <tr>
                                <td colspan="3" style="border-left: 0">City<br>
                                    ${page3City}</td>
                                <td colspan="2">Province/State<br>
                                    ${page3Province}</td>
                                <td colspan="2">Country<br>
                                    ${page3Country}</td>
                                <td colspan="3" style="border-right: 0">Postal Code/Zip Code<br>
                                    ${page3Postal}</td>
                            </tr>
                            <tr>
                                <td colspan="2" style="border-left: 0">Telephone Number<br>
                                    ${page3Telephone}</td>
                                <td colspan="2">Fax Number<br>
                                    ${page3Fax}</td>
                                <td colspan="8" style="border-right: 0">E-mail Address<br>
                                    ${page3Email}</td>
                            </tr>
                        </tbody>
                    </table>
                </span>
            </span>
            <div class="pageFooter">
                <div class="footerBottom">
                    <span class="footerLeft">PF-134E (2021)</span>
                    <span>© Queen''s Printer for Ontario</span>
                    <span class="footerRight" id="pageCount"></span><span class="footerRight" id="pageNumber">Page 3 of 13</span>
                </div>
            </div>
        </section>
        <!-- Page 4 -->
        <section size="A4">
            <span class="horizontalMargins">
                <span class="content">
                    <div class="greySection bold" style="margin-top: 0">Next Steps</div>
                    <div style="margin-top: 5pt" class="bold">
                        If Your Decision is Not to Divide the Family Law Value
                    </div>
                    <ul style="padding-left: 15pt; margin-top: 5pt">
                        <li style="padding-bottom: 3pt">
                            Consider informing the plan administrator that the family law value is not going to be
                            divided.
                        </li>
                        <li>Consider updating your spouse and beneficiary designation information.</li>
                    </ul>
                    <div style="margin-top: 5pt" class="bold">If Your Decision is to Divide the Family Law Value</div>
                    <ol style="padding-left: 15pt; margin-top: 5pt">
                        <li style="padding-bottom: 3pt">
                            Finalize the court order, family arbitration award or domestic contract. This document must:

                            <div style="padding-bottom: 3pt; padding-top: 3pt">
                                <span style="display: table-cell">a.&nbsp;&nbsp;</span>
                                <span style="display: table-cell">state the family law valuation date;</span>
                            </div>
                            <div style="padding-bottom: 3pt">
                                <span style="display: table-cell">b.&nbsp;&nbsp;</span>
                                <span style="display: table-cell">
                                    <span
                                        >include the name of the pension plan (as stated in
                                        <span class="bold">Part B</span>);
                                    </span>
                                </span>
                            </div>
                            <div style="padding-bottom: 3pt">
                                <span style="display: table-cell">c.&nbsp;&nbsp;</span>
                                <span style="display: table-cell">
                                    <span>authorize the lump sum transfer from the pension plan; and</span>
                                </span>
                            </div>
                            <div style="padding-bottom: 3pt">
                                <span style="display: table-cell">d.&nbsp;&nbsp;</span>
                                <span style="display: table-cell">
                                    state the amount to be transferred as either a specified amount ($) or a percentage
                                    (%) that does not exceed 50% of the family law value.
                                </span>
                            </div>
                        </li>
                        <li style="padding-bottom: 3pt">
                            The court order, family arbitration award or domestic contract must be a certified copy. A
                            “certified copy” is a copy of the original document that has been certified as being a true
                            copy of the original document.
                        </li>
                        <li style="padding-bottom: 3pt">
                            The Former Member’s spouse must complete the
                            <span class="bold">
                                Spouse’s Application for Transfer of a Lump Sum (Family Law Form FL–5)
                            </span>
                            and send this form together with the final court order, family arbitration award or domestic
                            contract (as applicable) to the plan administrator. The plan administrator may also require
                            the following additional information:
                        </li>
                    </ol>
					<p><span class="bold">Other important information about how OMERS Administration Corporation (OMERS) will administer a settlement from the OMERS Primary Pension Plan (the Plan), if any:</span></p>

<p><span class="bold">If former member has started their pension</span></p>
					<p>OMERS is not authorized to administer funds to a former spouse arising from marriage breakdown that have already been paid from the Plan.</p>

<p>If OMERS has reported on page 9/13 of this Statement that the member has retired (i.e. started to commence a pension) since this Statement has been issued, then:</p>
<ul>
<li><p>The amount OMERS has been directed to settle from the Plan arising from a FSCO Family Law Form 5 will be reduced.</p></li>

<li><p>The reduction is in proportion to the member’s pension that would have been adjusted (reduced) as a result of the settlement transfer amount retroactive to the commencement date of the retirement pension.</p></li>

<li><p>The member and the former spouse will have to manage the difference outside the Plan.</p></li>
</ul>
 <p class = "pPadding">The calculations performed for the Family Law Value in this Form 4 Statement set out the “property” that is the pension. The prescribed calculations and values reported assume the member has not commenced a pension. However,<br/>
 if the member has started a pension since his/her Family Law Value Date but before the settlement has been applied for, then each month s/he will have received a full pension benefit from the Plan. The monthly pension already paid includes the pension property value reported in this Statement. Once the full benefit (in this case monthly) is paid, the portion of the member’s benefit that would be adjusted to account for the settlement (retroactive to his/her retirement) no longer forms part of the member’s benefit that is available for division from the Plan.</p>

<p><span class= "bold">Note:</span> Interest will be added to the former spouse’s share of the Family Law Value from the Family Law Valuation Date to the beginning of the month in which the transfer is made, if:</p>
  <ol type = "i" style="padding-left: 15pt; margin-top: 5pt">
<li> the former spouse’s share is expressed as a proportion (i.e. percentage) of the Family Law Value in        the parties’ settlement instrument (court order, family arbitration award or domestic contract); or,</li>

<li>the former spouse’s share is expressed as a specified amount and the settlement instrument explicitly requires that interest is to be paid on that amount.</li>
</ol>


                    <div style="margin-top:7pt">
                        <span style="width: 100%;" class="underlineInput"></span>
                        <span class="bold" style="display: block">IMPORTANT:</span>
                        If the Former Member’s deferred pension and account balance (if any) ceased to be available under the pension plan
						before the Former Member’s spouse submits the
                        <span class="bold">Spouse’s Application for Transfer of a Lump Sum (Family Law Form FL–5) </span
                        >, the plan administrator may not be able to fully implement the transfer.
                    </div>
                </span>
            </span>
            <div class="pageFooter">
                <div class="footerBottom">
                    <span class="footerLeft">PF-134E (2021)</span>
                    <span>© Queen''s Printer for Ontario</span>
                    <span class="footerRight" id="pageCount"></span><span class="footerRight" id="pageNumber">Page 4 of 13</span>
                </div>
            </div>
        </section>
        <!-- Page 5 -->
        <section size="A4">
            <span class="horizontalMargins">
                <span class="header"style="height: 12mm; padding-bottom:5mm">
                    <span class="leftHeader"> </span>
                    <span class="rightHeader">
                        <div>Worksheet – Calculation of Preliminary Value, Family Law Value and Maximum Transfer</div>
                    </span>
                </span>
                <span class="content">
                    <p style="margin-bottom:0">
                        The Worksheet and Additional Disclosure sections provide details and data on the calculations for independent
                        verification. Any calculations that are not applicable will be left blank by the plan administrator.
                        The following information is provided on the Worksheet:
                        <ul style="margin-top:0">
                            <li>
                                <p>Step 1 is the calculation of the preliminary value. Calculations 1 and 3 apply to defined benefits and Calculation 2 to defined contribution benefits</p>
                            </li>
                            <li>
                                <p>Step 2 is the calculation of the family law value. Calculation 4 applies defined benefits and Calculation 5 to defined contribution benefits.</p>
                            </li>
                            <li>
                               <p> Step 3 is the calculation of the maximum transfer.</p>
                            </li>
                        </ul>
                    </p>
                    <div class="greySection bold" style="margin-top: 0">Step 1 – Calculation of Preliminary Value</div>

                        <span class="bold">Note:</span>
						<ul>
						<li><p>The <span class="bold">preliminary value</span> of the defined benefit is the total value of the pension accrued by the Former Member as of the family law valuation
                        date. It has not been adjusted to reflect the period of the spousal relationship.</li>
                        </p>
						<li><p>The <span class="bold">preliminary value</span> of the defined contribution benefit is the total value of the defined contribution benefit with interest/investment earnings credited to the Former Member as of the family law valuation date. It has not been
						adjusted to reflect the period of the spousal relationship.
						</p></li>
						</ul>
                    <p>
                        The following Calculation(s) applies (apply) to the Former Member:
                    </p>
                    <div style="margin-top: 5pt">
                        <label class="container">
                            <span>
                                <#if page5OnOrBefore==true>
                                <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                <#else>
                                <span class="checkmark"><input type="checkbox"/></span>
                                </#if>
                           The Former Member has a defined benefit. See <span class="bold">Calculation 1.</span>
                        </label>
                    </div>
                    <div style="margin-top: 5pt">
                        <label class="container">
                            <#if page5After==true>
                            <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                            <#else>
                            <span class="checkmark"><input type="checkbox"/></span>
                            </#if>
                            The Former Member has a defined contribution benefit. See <span class="bold">Calculation 2.</span>
                        </label>
                    </div>
                    <div style="margin-top: 5pt">
                        <label class="container">
                            <#if page5WoundUp==true>
                            <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                            <#else>
                            <span class="checkmark"><input type="checkbox"/></span>
                            </#if>
                            The pension plan is wound up. See <span class="bold">Calculation 3</span> if the Former Member has a defined benefit and the effective date of
						    the wind up is <span class="bold">on or before</span> the family law valuation date. See <span class="bold">Calculation 1</span> if
                            the wind up occurred <span class="bold">after</span> the family law valuation date. See also  <span class="bold">Calculation 2</span> if the Former Member has a defined contribution benefit.
                        </label>
                    </div>
                    <table style="margin-top: 10pt">
                       <thead>
                            <colgroup>
                                <col width="70%" />
                                <col width="15%" />
                                <col width="15%" />
                            </colgroup>
                        </thead>
						 <tbody>
                            <tr>
                                <th colspan="6" style="border:1px solid #000; background-color: #d3d3d3;">
                                    <div class="bold">Calculation 1:</div>
                                    <div style="font-weight: normal">Preliminary value of the Former Member’s <span class= "bold">defined benefit</span> as of the family law valuation date</div>
                                </th>
                            </tr>

                            <tr class="radio">
                                <td style="height:0">Initial preliminary value (commuted value of the defined benefit
								including any ancillary benefits as of the family law valuation date)</td>
                                <td style="height:0">&nbsp;&nbsp;$ ${page5Initial}</td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= G (defined benefit)</span></td>

                            </tr>
                            <tr class="radio">
                                <td style="height:0">Plus, surplus assets payable, if applicable (0 if not applicable or unknown) </td>
                                <td style="height:0">&nbsp;&nbsp;$ ${page5Plus}</td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= surplus</span></td>

                            </tr>
                            <tr class="radio">
                                <td style="height:0">Preliminary value (defined benefit) as of the family law valuation date</td>
                                <td style="height:0">&nbsp;&nbsp; $ ${page5Preliminary}</td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= G (defined benefit) + surplus</span></td>
                            </tr>
                        </tbody>
                    </table>
                </span>
            </span>
            <div class="pageFooter">
                <div class="footerBottom">
                    <span class="footerLeft">PF-134E (2021)</span>
                    <span>© Queen''s Printer for Ontario</span>
                    <span class="footerRight" id="pageCount"></span><span class="footerRight" id="pageNumber">Page 5 of 13</span>
                </div>
            </div>
        </section>
        <!-- Page 6 -->
        <section size="A4">
            <span class="horizontalMargins">
                <span class="content">

                    <table style="margin-top: 10pt">
                        <thead>
                            <colgroup>
                                <col width="13.33%" />
                                <col width="15%" />
                                <col width="21.66%" />
                                <col width="8%" />
                                <col width="23.33%" />
                                <col width="18.33%" />
                            </colgroup>
                            <tr>
                                <th colspan="6" style="border:1px solid #000; background-color: #d3d3d3;">
                                    <div class="bold">Calculation 2:</div>
                                    <div style="font-weight: normal">Preliminary value of the Former Member’s <span class="bold">defined contribution benefit</span> as of the family law valuation date </div>
                                </th>
                            </tr>
                        </thead>
                    </table>

					<p>If the plan administrator’s records include the exact account balance as of the family law valuation date, the
					preliminary value is:</p>

				<table>
				 <thead>
                            <colgroup>
                                <col width="70%" />
                                <col width="15%" />
                                <col width="15%" />
                            </colgroup>
				 <tr class="radio">
                                <td style="height:0">Total amount of contributions, including interest/investment earnings on the
								contributions, attributable to the Former Member as of the family law
								valuation date:
                                 </td>
                                <td style="height:0">&nbsp;&nbsp;$ ${page6DefinedContributionIncludeAccount}</td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= G (defined contribution benefit)</span></td>

                            </tr>
							</thead>
				</table><br>

				OR<br>

				   <p>If the plan administrator’s records do not include the exact account balance as of the family law valuation date, the
				preliminary value is calculated as:</p>
				<table>
				 <thead>
                            <colgroup>
                                <col width="70%" />
                                <col width="15%" />
                                <col width="15%" />
                            </colgroup>
				 <tr class="radio">
                                <td style="height:0">Total amount of contributions, including interest/investment earnings on the
								contributions, attributable to the Former Member as of the last day of the month
								immediately preceding the family law valuation date:</td>
                                <td style="height:0">&nbsp;&nbsp;$ ${page6DefinedContributionNotIncludeAccount}</td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= G (defined contribution benefit)</span></td>

                            </tr>
				</thead>
				</table><br>




                    <table style="margin-top: 5pt">
                        <thead>
                            <colgroup>
                                <col width="70%" />
                                <col width="15%" />
                                <col width="15%" />
                            </colgroup>
                            <tr>
                                <th colspan="3" style="border:1px solid #000; background-color: #d3d3d3;">
                                    <div class="bold">Calculation 3:</div>
                                    <div style="font-weight: normal">The pension plan is wound up and the effective date of the wind up is <span class="bold">on or before</span> the family law valuation date
									<span class="bold">(defined benefit)</span>.
                                        </div>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="radio">
                                <td style="height:0">Commuted value of the deferred pension (including any ancillary benefits)
								as of the wind up date</td>
                                <td style="height:0">&nbsp;&nbsp;$ ${page6Step1Commuted}</td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= X</span></td>

                            </tr>
                            <tr class="radio">
                                <td style="height:0">Plus, accumulated interest from the wind up date to the family
                                    law valuation date</td>
                                <td style="height:0">&nbsp;&nbsp;$ ${page6Step1Accumulated}</td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= Y</span></td>

                            </tr>
                            <tr class="radio">
                                <td style="height:0">Initial preliminary value <span class="bold">(X + Y)</span></td>
                                <td style="height:0">&nbsp;&nbsp;$ ${page6Step1Initial}</td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= G (defined benefit) </span></td>
                            </tr>
                            <tr class="radio">
                                <td style="height:0">Plus, surplus assets payable, if applicable (0 if not applicable or unknown)</td>
                                <td style="height:0">&nbsp;&nbsp;$
								${page6Step1Plus}</td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= surplus</span></td>
                            </tr>
                            <tr class="radio">
                                <td style="height:0">Preliminary value (defined benefit) as of the family law valuation date</span></td>
                                <td style="height:0">&nbsp;&nbsp;$ ${page6Step1Preliminary}</td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= G (defined benefit) + surplus</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="greySection bold" style="margin-top: 40pt">Step 2 – Calculation of Family Law Value</div>
                    <p><span class="bold">
                        Note:
                    </span> The family law value is the portion of the preliminary value that accrued during the spousal relationship (married or
                        common-law) as of the family law valuation date. </p>
						<div>
                        The following <span class="bold">Calculation(s)</span> applies (apply) to the Former Member:
                    </div>
						<div style="margin-top: 5pt">
                        <label class="container">
                            <span>
                                <#if page6OnOrBefore==true>
                                <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                <#else>
                                <span class="checkmark"><input type="checkbox"/></span>
                                </#if>
                           The Former Member has a defined benefit. See <span class="bold">Calculation 4.</span>
                        </label>
                    </div>
                    <div style="margin-top: 5pt">
                        <label class="container">
                            <#if page6After==true>
                            <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                            <#else>
                            <span class="checkmark"><input type="checkbox"/></span>
                            </#if>
                            The Former Member has a defined contribution benefit. See <span class="bold">Calculation 5.</span>
                        </label>
                    </div>

						 </span>
            </span>
            <div class="pageFooter">
                <div class="footerBottom">
                    <span class="footerLeft">PF-134E (2021)</span>
                    <span>© Queen''s Printer for Ontario</span>
                    <span class="footerRight" id="pageCount"></span><span class="footerRight" id="pageNumber">Page 6 of 13</span>
                </div>
            </div>
        </section>
		<!-- page7 -->
		<section size="A4">
            <span class="horizontalMargins">
                <span class="content">
                   <table style="margin-top: 5pt">
                        <thead>
                            <colgroup>
                                <col width="70%" />
                                <col width="15%" />
                                <col width="15%" />
                            </colgroup>
                            <tr>
                                <th colspan="3" style="border:1px solid #000; background-color: #d3d3d3;">
                                    <div class="bold">Calculation 4:</div>
                                    <div style="font-weight: normal">Family law value of the Former Member’s <span class="bold">defined benefit</span> as of the family law valuation date.</div>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="radio">
                                <td style="height:0">The preliminary value calculated under <span class="bold">Step 1 (Calculation 1 or 3)</span> </td>
                                <td style="height:0">&nbsp;&nbsp;$ ${page7Step2Preliminary}</td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= G (defined benefit) + surplus)</span></td>
                            </tr>
                            <tr class="radio">
                                <td style="height:0">Total credited service accrued by the Former Member during the spousal
								relationship period (i.e., beginning on the starting date and ending on the family
								law valuation date) </td>
                                <td style="height:0">&nbsp;&nbsp;&nbsp;&nbsp;${page7Step2Spousal}</td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= H</span></td>

                            </tr>
                            <tr class="radio">
                                <td style="height:0">Total credited service accrued by the Former Member during the entire period
								of employment or plan membership as of the family law valuation date	</span></td>
                                <td style="height:0">&nbsp;&nbsp;&nbsp;&nbsp;${page7Step2Member}</td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= J</span></td>
                            </tr>
                            <tr class="radio">
                                <td style="height:0">Family law value formula = <span class= "bold">[G(defined benefit) + surplus] x H/J</span> (Note: H/J cannot exceed 1.)
                                </td>
                                <td style="height:0">&nbsp;&nbsp;$ ${page7Step2FamilyLaw}</td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= family law
                                    value (defined benefit)</span></td>
                            </tr>
                        </tbody>
                    </table>

					<table style="margin-top: 10pt">
                        <thead>
                            <colgroup>
                                <col width="70%" />
                                <col width="15%" />
                                <col width="15%" />
                            </colgroup>
                            <tr>
                                <th colspan="3" style="border:1px solid #000; background-color: #d3d3d3;">
                                    <div class="bold">Calculation 5:</div>
                                    <div style="font-weight: normal">Family law value of the Former Member’s <span class= "bold">defined contribution benefit</span> as of the family law valuation date</div>
                                </th>
                            </tr>
                        </thead>
						</table>
						<p>
						<span class= "bold">Note:</span> The account balance in the calculations below includes interest/investment earnings on the contributions
						attributable to the Former Member.
						</p>

						<p>
						If the <span class = "bold">starting date</span> of the spousal relationship is <span class = "bold">before the date</span> when the Former Member joined the pension plan:
						</p>
						<table>
						<thead>
                            <colgroup>
                                <col width="70%" />
                                <col width="15%" />
                                <col width="15%" />
                            </colgroup>
						 <tr class="radio">

                                <td style="height:0">The <span class = "bold">family law value = preliminary value G (defined contribution benefit)</span>
								calculated in <span class = "bold">Step 1 (Calculation 2)</span>.</span></td>
                                <td style="height:0">&nbsp;&nbsp;&nbsp;&nbsp;$ ${page7FamilyLawValue}</td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= family law value (defined contribution benefit)</span></td>
                            </tr>
						</thead>
						</table>
						<br>
						OR
						<p>
						If the <span class = "bold">starting date</span> of the spousal relationship is <span class = "bold">on or after the date</span> when the Former Member joined the pension plan,
						the plan administrator is required to complete <span class = "bold">Calculation 5a</span> if the information is available. <span class = "bold">Calculation 5b</span> will only be
						completed if <span class = "bold">Calculation 5a</span> cannot be completed. <span class = "bold">Calculation 5c</span> will only be completed if <span class = "bold">Calculations 5a or 5b</span>
						cannot be completed.
						</p>
						 <table style="margin-top: 5pt">
                        <thead>
                            <colgroup>
                                <col width="70%" />
                                <col width="15%" />
                                <col width="15%" />
                            </colgroup>
                            <tr>
                                <th colspan="3" style="border:1px solid #000; background-color: #d3d3d3;">
                                    <div class="bold">Calculation 5a:</div>
                                    <div style="font-weight: normal">The <span class= "bold">account balance</span> as of the starting date of the spousal relationship <span class= "bold">can be determined.</span></div>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="radio">
                                <td style="height:0">The <span class="bold">preliminary value G (defined contribution benefit)</span> calculated in <span class="bold">Step 1
								(Calculation 2)</span> is:</td>
                                <td style="height:0">&nbsp;&nbsp;&nbsp;&nbsp;$ ${page7Calc5aDefinedBenefit}</td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= X</span></td>
                            </tr>
                            <tr class="radio">
                                <td style="height:0">The <span class="bold">account balance</span> at the starting date is: </td>
                                <td style="height:0">&nbsp;&nbsp;&nbsp;&nbsp;$ ${page7Calc5aAccountBalance}</td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= Y</span></td>

                            </tr>
                            <tr class="radio">
                                <td style="height:0"><span class="bold">X minus Y</span> is:</td>
                                <td style="height:0">&nbsp;&nbsp;&nbsp;&nbsp;$ ${page7Calculation5aFlvbenefit}</td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= family law value (defined contribution benefit)</span></td>
                            </tr>
                        </tbody>
                    </table>

                   <br>
				   OR
				   <br>
                </span>
            </span>
            <div class="pageFooter">
                <div class="footerBottom">
                    <span class="footerLeft">PF-134E (2021)</span>
                    <span>© Queen''s Printer for Ontario</span>
                    <span class="footerRight" id="pageCount"></span><span class="footerRight" id="pageNumber">Page 7 of 13</span>
                </div>
            </div>
        </section>
		<!-- page8 -->
		<section size="A4">
            <span class="horizontalMargins">
                <span class="content">
                   <table style="margin-top: 0pt">
                        <thead>
                            <colgroup>
                                <col width="70%" />
                                <col width="15%" />
                                <col width="15%" />
                            </colgroup>
                            <tr>
                                <th colspan="3" style="border:1px solid #000; background-color: #d3d3d3;">
                                    <div class="bold">Calculation 5b:</div>
                                    <div style="font-weight: normal">The <span class="bold">account balance</span> as of the starting date of the spousal relationship <span class="bold">cannot be determined</span>. However, the account
									balance can be determined on a date that falls between 45 days before and 45 days after the starting date of the spousal
									relationship.</div>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="radio">
                                <td style="height:0">The <span class="bold">account balance</span> can be determined as of:</td>
                                <td style="height:0">&nbsp;&nbsp;&nbsp;&nbsp; ${page8AsOFAccountDeterminationDate}</td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= (yyyy/mm/dd)</span></td>
                            </tr>
                            <tr class="radio">
                                <td style="height:0">The <span class="bold">preliminary value G (defined contribution benefit)</span> calculated in <span class="bold">Step 1
							(Calculation 2)</span> is: </td>
                                <td style="height:0">&nbsp;&nbsp;$ ${page8Calc5bPreliminaryValue}</td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= X</span></td>

                            </tr>
							<tr class="radio">
                                <td style="height:0">The <span class="bold">account balance</span> as of the determined date is:</td>
                                <td style="height:0">&nbsp;&nbsp;$ ${page8Calc5bPreliminaryValue}</td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= Y</span></td>

                            </tr>

                            <tr class="radio">
                                <td style="height:0"><span class="bold">X minus Y</span> is:</td>
                                <td style="height:0">&nbsp;&nbsp;$ ${page8Calc5bFamilyLaw}</td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= family law
                                    value (defined contribution benefit)</span></td>
                            </tr>
                        </tbody>
                    </table><br>

					OR
					<table style="margin-top: 5pt">
                        <thead>
                            <colgroup>
                                <col width="70%" />
                                <col width="15%" />
                                <col width="15%" />
                            </colgroup>
                            <tr>
                                <th colspan="3" style="border:1px solid #000; background-color: #d3d3d3;">
                                    <div class="bold">Calculation 5c:</div>
                                    <div style="font-weight: normal">The <span class= "bold">account balance</span> as of the starting date of the spousal relationship is being determined in accordance with
									section 18 of Ontario Regulation 287/11 with necessary modifications.</div>
                                </th>
                            </tr>
                        </thead>
						<tbody>
                            <tr class="radio">
                                <td style="height:0">The <span class= "bold">preliminary value G (defined contribution benefit)</span> calculated in <span class= "bold">Step 1 (Calculation 2)</span> is:</td>
                                <td style="height:0">&nbsp;&nbsp;$ ${page8Calc5cPreliminaryValue}</td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= G</span></td>
                            </tr>
                            <tr class="radio">
                                <td style="height:0">The period of spousal relationship (i.e., beginning on the starting date and
								ending on the family law valuation date) is: </td>
                                <td style="height:0">&nbsp;&nbsp;&nbsp;&nbsp; ${page8Calc5cPeriodOfSpousalRelation}</td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= H</span></td>

                            </tr>

                            <tr class="radio">
                                <td style="height:0">The entire period of employment or plan membership as of the family law
								valuation date is:</td>
                                <td style="height:0">&nbsp;&nbsp;&nbsp;&nbsp; ${page8Calc5cEntirePeridOfEmployment}</td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= J</span></td>
                            </tr>
							<tr class="radio">
                                <td style="height:0">Family law value formula is <span class= "bold">G x H/J</span><br>
								(Note: H/J cannot exceed 1.)</td>
                                <td style="height:0">&nbsp;&nbsp;$ ${page8Calc5cFamilyLawValue}</td>
                                <td style="height:0; background-color: #d3d3d3; height:30px"><span class="bold">= family law
                                    value (defined contribution benefit)</span></td>
                            </tr>
                        </tbody>
                    </table>
                   <br>
			<div class="greySection bold">Step 3 - Maximum Amount that May Be Transferred to the Former Member’s Spouse</div>
			<p>
			The portion of the family law value payable to the Former Member’s spouse <span class ="bold">cannot exceed 50%</span> of the <span class ="bold">total family law
			value</span> calculated under <span class ="bold">Step 2</span> above.
			</p>
			<table>
			 <thead>
                            <colgroup>
                                <col width="75%" />
                                <col width="25%" />

                            </colgroup>
			<tr class="radio">
                                <td style="height:0">The <span class ="bold">total maximum amount</span> of the <span class ="bold">family law value</span> (defined benefit plus defined contribution benefit
								(if any)) that may be transferred as equalization to the Former Member’s spouse from the pension plan
								is:</td>
                                <td style="height:0">&nbsp;&nbsp;$
								${page8TotalFlv}</td>
                            </tr>
							</thead>
			</table>
			<p>
			<span class="bold">Note:</span> If the Former Member has an entitlement to both a defined benefit and a defined contribution benefit as of the
		   family law valuation date, the lump sum may be transferred wholly from the defined benefit or wholly from the defined
		   contribution benefit, or a portion may be transferred from each.
			</p>


                </span>
            </span>
            <div class="pageFooter">
                <div class="footerBottom">
                    <span class="footerLeft">PF-134E (2021)</span>
                    <span>© Queen''s Printer for Ontario</span>
                    <span class="footerRight" id="pageCount"></span><span class="footerRight" id="pageNumber">Page 8 of 13</span>
                </div>
            </div>
        </section>
        <!-- Page 9 -->
        <section size="A4">
            <span class="horizontalMargins">
                <span class="header"style="height: 8mm;">
                    <span class="leftHeader" style="width:68%"> </span>
                    <span class="rightHeader" style="width:55mm">
                        <div>Additional Disclosures</div>
                    </span>
                </span>
                <span class="content">
                    <table style="margin-top: 0">
                        <thead>
                            <colgroup>
                                <col width="60%" />
                                <col width="20%" />
                                <col width="20%" />
                            </colgroup>
                        </thead>
                        <tbody>
                            <tr class="radio">
                                <td style="height:0" colspan="3"><span class="bold">Plan Membership and Employment Information as of the Family Law Valuation Date</span></td>
                            </tr>
                            <tr class="radio">
                                <td style="border-right:0">The Former Member joined the pension plan on (yyyy/mm/dd)</td>
                                <td style="border-left:0; border-right:0"m>${page9JoinedDate}</td>
                                <td style="border-left:0"></td>
                            </tr>
							<tr class="radio">
                                <td style="border-right:0">The Former Member terminated employment or plan membership on
								(yyyy/mm/dd)</td>
                                <td style="border-left:0; border-right:0"m>${page9TerminationDate}</td>
                                <td style="border-left:0"></td>
                            </tr>
                            <tr class="radio">
                                <td style="border-right:0">The Former Member became a retired member after the family law valuation
								date on (yyyy/mm/dd)</td>
                                <td style="border-left:0; border-right:0">${page9FlvDate}</td>
                                <td style="border-left:0"><label class="container"
                                    >not applicable
                                    <#if page9FlvDateNA==true>
                                    <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                    <#else>
                                    <span class="checkmark"><input type="checkbox"/></span>
                                    </#if>
                                </label></td>

                            </tr>

                        </tbody>
                    </table><br>
                    <table style="margin-top: 10pt">
                        <thead>
                            <colgroup>
                                <col width="40%" />
                                <col width="37.5%" />
                                <col width="22.5%" />
                            </colgroup>
                        </thead>
                        <tbody>
                            <tr class="radio">
                                <td style="height:0" colspan="3"><span class="bold">Information about the Former Member’s Accrued Pension (Defined Benefit) for Calculation 1 </span></td>
                            </tr>

                            <tr class="radio">
                                <td style="border-right:0">Accrued lifetime pension as of the family law
                                    valuation date</td>
                                    <td style="border-left:0; border-right:0">
                                        <label class="container">
                                        monthly
                                        <#if page9Calc1And2LifetimeMonthly==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                    <label class="container">
                                        annual
                                        <#if page9Calc1And2LifetimeAnnual==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label></td>
                                <td style="border-left:0">$ ${page9Calc1And2Lifetime}</td>
                            </tr>
                            <tr class="radio">
                                <td style="border-right:0">Accrued bridging/supplemental benefit as of
                                    the family law valuation date </td>
                                    <td style="border-left:0; border-right:0">
                                        <label class="container">
                                        monthly
                                        <#if page9Calc1And2BridgingMonthly==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                    <label class="container">
                                        annual
                                        <#if page9Calc1And2BridgingAnnual==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                    <label class="container">
                                        not applicable
                                        <#if page9Calc1And2BridgingNA==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label></td>
                                <td style="border-left:0">$ ${page9Calc1And2Bridging}</td>
                            </tr>
                            <tr class="radio">
                                <td style="border-right:0">Canada Pension Plan reduction at age 65</td>
                                    <td style="height:0; border-left:0; border-right:0">
                                        <label class="container">
                                        monthly
                                        <#if page9Calc1And2ReductionMonthly==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                    <label class="container">
                                        annual
                                        <#if page9Calc1And2ReductionAnnual==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                    <label class="container">
                                        not applicable
                                        <#if page9Calc1And2ReductionNA==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label></td>
                                <td style="border-left:0">$ ${page9Calc1And2Reduction}</td>
                            </tr>
                             <tr class="radio">
                                <td style="border-right:0" colspan="2">Former Member’s age on the family law valuation date</td>
                                <td style="border-left:0">&nbsp;&nbsp;&nbsp;${page9Calc1And2Valuation}</td>
                            </tr>

                        </tbody>
                    </table><br>
                    <table style="margin-top: 10pt">
                        <thead>
                            <colgroup>
                                <col width="40%" />
                                <col width="37.5%" />
                                <col width="22.5%" />
                            </colgroup>
                        </thead>
                        <tbody>
                            <tr class="radio">
                                <td style="height:0" colspan="3"><span class="bold">Information about the Former Member’s Accrued Pension (Defined Benefit) as of the Wind Up Date for Calculation 3</span></td>
                            </tr>

                            <tr class="radio">
                                <td style="border-right:0">Accrued lifetime pension as of the  wind up date</td>
                                    <td style="border-left:0; border-right:0">
                                        <label class="container">
                                        monthly
                                        <#if page9Calc3LifetimeMonthly==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                    <label class="container">
                                        annual
                                        <#if page9Calc3LifetimeAnnual==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label></td>
                                <td style="border-left:0">$
								${page9Calc3Lifetime}</td>
                            </tr>
                            <tr class="radio">
                                <td style="border-right:0">Accrued bridging/supplemental benefits as of the wind up date</td>
                                    <td style="border-left:0; border-right:0">
                                        <label class="container">
                                        monthly
                                        <#if page9Calc3BridgingMonthly==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                    <label class="container">
                                        annual
                                        <#if page9Calc3BridgingAnnual==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                    <label class="container">
                                        not applicable
                                        <#if page9Calc3BridgingNA==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label></td>
                                <td style="border-left:0">$
								${page9Calc3Bridging}</td>
                            </tr>
                            <tr class="radio">
                                <td style="border-right:0">Canada Pension Plan reduction at age 65</td>
                                    <td style="height:0; border-left:0; border-right:0">
                                        <label class="container">
                                        monthly
                                        <#if page9Calc3ReductionMonthly==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                    <label class="container">
                                        annual
                                        <#if page9Calc3ReductionAnnual==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                    <label class="container">
                                        not applicable
                                        <#if page9Calc3ReductionNA==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label></td>
                                <td style="border-left:0">$
								${page9Calc3Reduction}</td>
                            </tr>
                             <tr class="radio">
                                <td style="border-right:0" colspan="2">Former Member’s age on the wind up date</td>
                                <td style="border-left:0">&nbsp;&nbsp;&nbsp;${page9Calc3WindUp}</td>
                            </tr>
                        </tbody>
                    </table><br>

                </span>
            </span>
            <div class="pageFooter">
                <div class="footerBottom">
                    <span class="footerLeft">PF-134E (2021)</span>
                    <span>© Queen''s Printer for Ontario</span>
                    <span class="footerRight" id="pageCount"></span><span class="footerRight" id="pageNumber">Page 9 of 13</span>
                </div>
            </div>
        </section>
        <!-- Page 10 -->
        <section size="A4">
            <span class="horizontalMargins">
                <span class="content">
                    <p class="bold">Explanation of Pension Plan Provisions that Apply to the Former Member to Calculate the Family Law Value</p>
                    <label class="container">
                        Plan provisions are explained in a separate document that is included with this statement.
                        <#if page10Provisions==true>
                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                        <#else>
                        <span class="checkmark"><input type="checkbox"/></span>
                        </#if>
                    </label>
                    <span style="width: 100%;" class="underlineInput"></span>
                    <p>The following are details of the plan provisions (for example: benefit type, pension benefit formula, normal retirement
                        date, early retirement provision(s), normal form, ancillary benefit(s), indexation, etc.):</p>
                    ${page9Details}
                </span>
            </span>
            <div class="pageFooter">
                <div class="footerBottom">
                    <span class="footerLeft">PF-134E (2021)</span>
                    <span>© Queen''s Printer for Ontario</span>
                    <span class="footerRight" id="pageCount"></span><span class="footerRight" id="pageNumber">Page 10 of 13</span>
                </div>
            </div>
        </section>
        <!-- Page 11 -->
        <section size="A4">
            <span class="horizontalMargins">
                <span class="content">
                    <div class="bold" style="margin-bottom:5pt">Actuarial Assumptions Used in the Calculation of the Preliminary Value (defined benefit)</div>
                    <label class="container" style="margin-bottom:5pt">
                        Actuarial assumptions are provided in a separate document that is included with this statement.
                        <#if page11Actuarial==true>
                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                        <#else>
                        <span class="checkmark"><input type="checkbox"/></span>
                        </#if>
                    </label>
                    <table style="margin-top: 5pt">
                        <thead>
                            <colgroup>
                                <col width="50%" />
                                <col width="50%" />
                            </colgroup>
                            <tr>
                                <th style="border:1px solid #000; background-color: #d3d3d3; text-align:center; vertical-align: top;">
                                    Assumptions based on section 3500 of the Canadian Institute of Actuaries Standards of Practice
                                </th>
                                <th style="border:1px solid #000; background-color: #d3d3d3; text-align:center; vertical-align: top">
                                    Assumptions
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="radio">
                                <td style="height:60pt;vertical-align: top;">Non-indexed interest rate(s)
                                </td>
                                <td>${page11NonIndex}
                                </td>
                            </tr>
                            <tr class="radio">
                                <td style="height:60pt;vertical-align: top;">Indexed interest rate(s)<br>
                                    <label class="container">
                                        not applicable
                                        <#if page11IndexNA==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                </td>
                                <td>${page11Index}</td>
                            </tr>
                            <tr class="radio">
                                <td style="height:60pt;vertical-align: top;">Rate(s) of pension escalation<br>
                                    <label class="container">
                                        not applicable
                                        <#if page11RateNA==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                </td>
                                <td>${page11Rate}</td>
                                </tr>
                            <tr class="radio">
                                <td style="height:60pt;vertical-align: top;">Mortality table<br>
                                    <label class="container">
                                        Unisex (specify % male and % female) and/or
                                        <#if page11MortalityUnisex==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                    <br>
                                    <label class="container">
                                        Sex-distinct (pre-87 service only)
                                        <#if page11MortalitySex==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                </td>
                                <td>${page11Mortality}</td>
                            </tr>
                            <tr class="radio">
                                <td style="height:60pt;vertical-align: top;">Marital assumption at retirement: percent married<br>
                                    <label class="container">
                                        not applicable
                                        <#if page11PercentNA==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                </td>
                                <td >${page11Percent}</td>
                            </tr>
                            <tr class="radio">
                                <td style="height:60pt;vertical-align: top;">Marital assumption at retirement: age difference
                                    between plan members and their spouses<br>
                                    <label class="container">
                                        not applicable
                                        <#if page11DifferenceNA==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                </td>
                                <td>${page11Difference}</td>
                            </tr>
                            <tr class="radio">
                                <td style="height:100p;vertical-align: top;">Other relevant assumptions<br>
                                    <label class="container">
                                        not applicable
                                        <#if page11AssumptionNA==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                </td>
                                <td>${page11Assumption}</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="bold" style="margin-top:10pt; margin-bottom:5pt">Shortened Life Expectancy Information</div>
                    <label class="container" style="margin-bottom:5pt">
                        not applicable
                        <#if page11ShortenedNA==true>
                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                        <#else>
                        <span class="checkmark"><input type="checkbox"/></span>
                        </#if>
                    </label>
                    <table>
                        <tbody>
                            <tr>
                                <td>The Former Member has filed a shortened life expectancy application and the conditions that are specified under section 12
                                    or 13 of Ontario Regulation 287/11 (Family Law Matters) apply. The following are the actuarial assumptions used in the
                                    calculation of the shortened life expectancy family law value</td>
                            </tr>
                            <tr>
                                <td style="height:150pt; width:186.6mm; text-align: top;">${page11Shortened}</td>
                            </tr>
                        </tbody>
                    </table>
                </span>
            </span>
            <div class="pageFooter">
                <div class="footerBottom">
                    <span class="footerLeft">PF-134E (2021)</span>
                    <span>© Queen''s Printer for Ontario</span>
                    <span class="footerRight" id="pageCount"></span><span class="footerRight" id="pageNumber">Page 11 of 13</span>
                </div>
            </div>
        </section>
        <!-- Page 12 -->
        <section size="A4">
            <span class="horizontalMargins">
                <span class="content">
                    <div class="bold" style="margin-top:10pt; margin-bottom:5pt">Information about the wind up of the pension plan</div>
                    <label class="container" style="margin-bottom:5pt">
                        not applicable
                        <#if page12WindUpNA==true>
                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                        <#else>
                        <span class="checkmark"><input type="checkbox"/></span>
                        </#if>
                    </label>
                    <table>
                        <tbody style="vertical-align: middle;">
                            <tr>
                                <td colspan="2">The following information has been completed because the Former Member is included in the wind up group. The effective
                                    date of the wind up is <span class="bold">on or before</span> the date of this statement.</td>
                            </tr>
                            <tr>
                                <td colspan="2">Effective date of the wind up of the pension plan is (yyyy/mm/dd)&nbsp;&nbsp;${page12WindUpDate}</td>
                            </tr>
                            <tr>
                                <td style="border-right:0">The Former Member’s pension will be reduced as a result of the wind up</td>
                                    <td style="border-left:0">
                                        <label class="container">
                                        yes
                                        <#if page12WindUpYes==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                    <label class="container">
                                        no
                                        <#if page12WindUpNo==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                    <label class="container">
                                        unknown
                                        <#if page12WindUpUnknown==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label></td>
                            </tr>
                            <tr>
                                <td style="border-right:0">The pension plan is covered by the Pension Benefits Guarantee Fund</td>
                                    <td style="border-left:0">
                                        <label class="container">
                                        yes
                                        <#if page12GuaranteeYes==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label>
                                    <label class="container">
                                        no
                                        <#if page12GuaranteeNo==true>
                                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                                        <#else>
                                        <span class="checkmark"><input type="checkbox"/></span>
                                        </#if>
                                    </label></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="bold" style="margin-top:10pt; margin-bottom:5pt">Information about surplus application made on or before the family law valuation date</div>
                    <label class="container" style="margin-bottom:5pt">
                        not applicable
                        <#if page12ApplicationNA==true>
                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                        <#else>
                        <span class="checkmark"><input type="checkbox"/></span>
                        </#if>
                    </label>
                    <table>
                        <tbody>
                            <tr>
                                <td>The Former Member is entitled to receive a share of surplus from the pension plan, which is not included in the family law
                                    value. The following is a summary of the relevant details of the surplus application (e.g., information about the surplus
                                    sharing agreement, etc.)</td>
                            </tr>
                            <tr>
                                <td style= "height:150pt">${page12Application}</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="bold" style="margin-top:20pt; margin-bottom:5pt">Information about pension plan amendments before the family law valuation date</div>
                    <label class="container" style="margin-bottom:5pt">
                        not applicable
                        <#if page12Ammendments==true>
                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                        <#else>
                        <span class="checkmark"><input type="checkbox"/></span>
                        </#if>
                    </label>
                    <table>
                        <thead>
                            <colgroup>
                                <col width="20%" />
                                <col width="80%" />
                            </colgroup>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="2">The Former Member belongs to a class of employees that received (or will be receiving) payment(s) resulting from
                                    amendment(s) to the pension plan related to cost of living adjustments during the last three fiscal years of the pension
                                    plan before the family law valuation date. The following is an explanation of the amendment(s) [e.g., date when the
                                    amendment was made, how much the Former Member received (or will receive), etc.]. </td>
                            </tr>
                            <tr>
                                <td style="border-right:0; vertical-align: middle; padding-left:10pt"><span class="bold">Year 1</span></td>
                                <td style="border-left:0">${page12Year1}</td>
                            </tr>
                            <tr>
                                <td style="border-right:0; vertical-align: middle; padding-left:10pt"><span class="bold">Year 2</span></td>
                                <td style="border-left:0">${page12Year2}</td>
                            </tr>
                            <tr>
                                <td style="border-right:0; vertical-align: middle; padding-left:10pt"><span class="bold">Year 3</span></td>
                                <td style="border-left:0">${page12Year3}</td>
                            </tr>
                        </tbody>
                    </table>
                </span>
            </span>
            <div class="pageFooter">
                <div class="footerBottom">
                    <span class="footerLeft">PF-134E (2021)</span>
                    <span>© Queen''s Printer for Ontario</span>
                    <span class="footerRight" id="pageCount"></span><span class="footerRight" id="pageNumber">Page 12 of 13</span>
                </div>
            </div>
        </section>
        <!-- Page 13 -->
        <section size="A4">
            <span class="horizontalMargins">
                <span class="content">
                    <div class="bold" style="margin-top:10pt; margin-bottom:5pt">Information about additional voluntary contributions (AVCs) as of the family law valuation date</div>
                    <label class="container" style="margin-bottom:5pt">
                        not applicable
                        <#if page13AVCNA==true>
                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                        <#else>
                        <span class="checkmark"><input type="checkbox"/></span>
                        </#if>
                    </label>
                    <table>
                        <thead>
                            <colgroup>
                                <col width="77%" />
                                <col width="23%" />
                            </colgroup>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="2">AVCs are voluntary contributions that a Former Member has made beyond those that are required to be made under the pension plan. The terms of the pension plan specify whether AVCs are allowed and how they are to
                                    be paid out. AVCs are <span class="bold">not included</span> in the family law value set out in <span class="bold">Part A</span> of this statement.</td>
                            </tr>
                            <tr>
                                <td style="border-right:0; height:30pt; vertical-align: middle">The total AVCs as of the family law valuation date, including interest/investment earnings</td>
                               <td style="height:0;vertical-align:middle">&nbsp;&nbsp;$ ${page13Family}</td>
                            </tr>
                            <tr>
                                <td style="border-right:0; height:30pt; vertical-align: middle">The total AVCs from the starting date of the spousal relationship to the family law valuation date,
                                    including interest/investment earnings (provided if available)</td>
                                <td style="height:0;vertical-align:middle">&nbsp;&nbsp;$
								${page13Spousal}</td>
                            </tr>
                        </tbody>
                    </table>
					<div class="bold" style="margin-top:10pt; margin-bottom:5pt">Information about excess member contributions as of the family law valuation date</div>
                    <label class="container" style="margin-bottom:5pt">
                        not applicable
                        <#if page13AVCNA==true>
                        <span class="checkmark"><input type="checkbox" checked="checked"/></span>
                        <#else>
                        <span class="checkmark"><input type="checkbox"/></span>
                        </#if>
                    </label>
					<table>
                        <thead>
                            <colgroup>
                                <col width="77%" />
                                <col width="23%" />
                            </colgroup>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="2">Excess member contributions arise in cases where a pension plan member''s required contributions to the pension plan
								made on or after January 1, 1987 (or an earlier date specified in the pension plan), and interest/investment earnings on
								those contributions, exceed 50% of the commuted value of the deferred pension earned after that date. The Former
								Member’s excess member contributions, if any, are <span class="bold">not included</span> in the family law value set out in <span class="bold">Part A</span> of this statement.</td>
															</tr>
															 </tbody>

			<tr class="radio">
                                <td style="border-right:0; height:30pt; vertical-align: middle">The total excess member contributions, including interest/investment earnings, remaining in the pension plan:</td>
                                <td style="height:0">&nbsp;&nbsp;$
								${page13Family}</td>
                            </tr>
							</thead>
			</table>
                </span>
            </span>
            <div class="pageFooter">
                <div class="footerBottom">
                    <span class="footerLeft">PF-134E (2021)</span>
                    <span>© Queen''s Printer for Ontario</span>
                    <span class="footerRight" id="pageCount"></span><span class="footerRight" id="pageNumber">Page 13 of 13</span>
                </div>
            </div>
        </section>
    </body>

</html>', true, 1, 'dms_template', current_timestamp);




insert into dmstemplate.template_history (audit_id,template_id, process_id, template_name, template_type, approved_by, modified_by,
                                  modified_on, template_fields, template_data, is_active, version, created_by,
                                  created_on)
values ('8cd6d135-42e3-4399-ad4b-2ae7b8b8f079','6ffd6a5a-198e-11ed-861d-0242ac120004', 'SAD', 'FLV_PlanProvisions4B_NRA65_vf_2022_Template', 'HTML', '', 'dms_template',
        current_timestamp, '[]',
        '<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css">

        @page :first {
            size: 8.50 *11.00in;
            margin: 8mm;
        }

        table, th, td {
            border: 1pt solid;
            border-collapse: collapse;
        }

        td {
            padding: 0pt 0pt 2pt 4pt;
        }

        th {
            text-align: center;
        }

        table {
            width: auto;
        }

        tr {
            line-height: 8pt;
        }

        span.cls_003 {
            font-family: Arial, serif;
            font-size: 14.4pt;
            color: rgb(0, 0, 0);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }

        div.cls_003 {
            position: absolute;
            right: 8pt;
            top: 56.51pt;
        }

        span.cls_004 {
            font-family: Arial, serif;
            font-size: 13.2pt;
            color: rgb(0, 0, 0);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }

        div.cls_004 {
            position: absolute;
            right: 8pt;

        }

        span.cls_005 {
            font-family: Arial, serif;
            font-size: 11.4pt;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }

        div.cls_005 {
            position: absolute;
            right: 8pt;
            top: 99.28pt
        }

        span.cls_006 {
            font-family: Arial, serif;
            font-size: 11.4pt;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: italic;
            text-decoration: none
        }


        span.cls_007 {
            font-family: Arial, serif;
            font-size: 8pt;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }

        span.cls_012 {
            font-family: Arial, serif;
            font-size: 6.1pt;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: normal;
            text-decoration: underline
        }


        span.cls_008 {
            font-family: Arial, serif;
            font-size: 8pt;
            color: rgb(0, 0, 0);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }


        span.cls_002 {
            font-family: Arial, serif;
            font-size: 8.2pt;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }


        span.cls_013 {
            font-family: Arial, serif;
            font-size: 9.2pt;
            color: rgb(0, 0, 0);
            font-weight: bold;
            font-style: normal;
            text-decoration: underline
        }


        span.cls_010 {
            font-family: Arial, serif;
            font-size: 7.2pt;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: italic;
            text-decoration: none
        }


        span.cls_011 {
            font-family: Arial, serif;
            font-size: 7.5pt;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: italic;
            text-decoration: none
        }

        span.cls_014 {
            font-family: Arial, serif;
            font-size: 8.2pt;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: normal;
            text-decoration: underline
        }


        span.cls_009 {
            font-family: Arial, serif;
            font-size: 7.2pt;
            color: rgb(0, 0, 0);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }
    </style>
</head>
<body>
<div>
    <img src="OMERS_PAGE_LOGO_BW" style="
    position: absolute;
    height: 50pt;
    padding-left: 10pt;
    top: 0pt;

">
    <div class="cls_003"><span class="cls_003">Additional Disclosures - Attachment (NRA 65)</span>
    </div>
    <div style="top:71.51pt"  class="cls_004"><span class="cls_004">Explanation of Pension Plan Provisions that Apply to the Plan Member</span>
    </div>
    <div style="top:84.80pt" class="cls_004"><span class="cls_004">to Calculate the Family Law Value</span>
    </div>
    <div class="cls_005"><span class="cls_005">Replacement for Page 9/12 of the </span><span
            class="cls_006">Statement of Family Law Value</span></div>
    <div style=" padding-top: 110pt; ">
    <table><col style="width:37%">
        <col style="width:63%">
    <tr><td colspan="2"><span class="cls_007">The defined benefit provisions of the OMERS Primary Pension Plan are more broadly described in the member handbook found at </span><span
            class="cls_012">www.omers.com</span></td></tr>
   <tr><th valign = "center"> <span
           class="cls_008">Plan Provisions</span></th>
    <th valign = "center"><span class="cls_008">Provide Details (if Applicable)</span>
    </th></tr>
   <tr><td><span class="cls_002">Plan type</span>
  </td>
   <td><span class="cls_002">Jointly Sponsored Pension Plan</span>
   </td></tr>
   <tr><td><span class="cls_002">Benefit type</span>
   </td><td><span class="cls_002">Defined Benefit - Best Average Earnings (BAE): Best 60 consecutive months of contributory earnings</span>
   </td></tr>


   <tr><td valign = "top"><span class="cls_002">Pension benefit formula (defined benefit)</span>
   </td>
    <td><span class="cls_013">Normal Retirement Pension:</span>

    <span class="cls_010">2% x BAE x pre-1966 service + ((1.325% x lesser of AYMPE and BAE) + (2% x [BAE minus AYMPE]) x credited

   service after 1965). </span><span class="cls_002">If a member reached 35 years of credited service prior to January 1, 2021, their credited

    service will be capped at 35 years</span><span
            class="cls_010">. </span><span class="cls_002">Maximum pension credit prescribed under the ITA applies to credited service

    after 1991<br></span>

    <span class="cls_011">AYMPE (Final 5) is based average of the annual YMPE for the year of termination and the 4 preceding years</span><span
            class="cls_010">.</span></td></tr>
    <tr><td> <span class="cls_002">Canada Pension Plan/Old Age Security offset formula</span></td>

        <td><span class="cls_010">Note - The terms integration/offset/bridge are used interchangeably in OMERS communications.</span></td></tr>

 <tr><td><span class="cls_002">Canada Pension Plan/Old Age Security integration formula (and average YMPE used in the calculation)</span>
 </td>
    <td><span class="cls_014">Unreduced</span><span class="cls_002"> Bridge discontinued at age 65 (See ancillary benefits)</span>
    </td></tr>


   <tr><td valign = "top"><span class="cls_002">Normal retirement date (NRD)</span>
   </td>
    <td><span class="cls_002">NRD - End of the month the member turns age 65</span>
<br>
    <span class="cls_002">NRA (Normal retirement age) is attained age 65.</span>
    </td></tr>
        <tr><td valign = "top"><span class="cls_002">Early retirement options</span>
        </td>
    <td>
    <span class="cls_002">Within 10 years of Normal Retirement Age (55) regardless of service.</span>


    <span class="cls_009"><br>Early Retirement Pension:</span><span
            class="cls_002"> (Normal Retirement Pension plus Bridge [see below]) x Reduction factor
    Benefits are unreduced if member has reached either 65 years of age, 30 years of qualifying service or 90 Factor

   (age + qualifying service).  If the member has not reached the either milestone, then the pension benefit is reduced

   by 5% times number of years the member is from the nearest milestone. </span><span
            class="cls_010">(Also - see Benefit Calculation Changes below)</span></td></tr>

  <tr><td valign = "top">
    <span
            class="cls_002">Termination benefit</span></td>
      <td>
    <span class="cls_002">Termination before the member is within 10 years of Normal Retirement Age: Member is entitled to a deferred

    pension.  Optional pre-1987 refund contributions with interest (C+I).</span>
    </td></tr>
        <tr>
    <td valign = "top">
    <span
            class="cls_002">Postponed retirement</span></td>
        <td>
    <span class="cls_002">Members who remain in employment beyond NRD continue to accrue service until the earlier of November 30 of

   the year they turn age 71 or 35 years of credited service is achieved, if achieved prior to January 1, 2021</span>
        </td></tr>
        <tr><td valign = "top">
        <span class="cls_002">Pre-retirement death benefit</span>
        </td>
   <td>
    <span class="cls_002">Order of entitlement to survivor benefits sets first in line for benefits, next in line follows the absence or the prior


    survivor (see Plan Member Handbook for greater detail):<br>
    1.
    Eligible spouse - 66 2/3% (normal retirement pension) plus 10% (normal retirement pension) per <span style="padding-left: 9pt" > eligible

      dependent child (max 100% normal retirement pension).  Optional refund based on value of </span><span style="padding-left: 9pt">member

   pension at death (pre-1987 C+I, post-1986 commuted value).<br>

    2.
    Eligible children - 66 2/3% normal retirement pension shared among eligible dependent children.<br>

    3.
   Living designated beneficiary:  Refund based on value of member’s pension at death.<br>

    4.
        Estate: Refund based on value of member’s pension at death.</span></span>

   </td></tr>
    <tr><td><span class="cls_002">Normal form of pension</span>
    </td><td><span class="cls_002">Joint and Survivor 66 2/3% (no optional forms)</span>
    </td></tr>
        <tr>
        <td valign="top">
        <span class="cls_002">Ancillary benefits (bridging, supplemental, disability,

        etc.)</span></td>

    <td>
    <span class="cls_009">Bridge (see CPP Integration)</span><span
            class="cls_002">: Formula (</span><span class="cls_010">see Benefit Calculation Changes </span><span
            class="cls_002">below)</span><br>

    <span class="cls_002">0.675% * AYMPE x credited service after 1965 (</span><span
            class="cls_014">reduced</span><span class="cls_002"> as part of “Early Retirement Formula”).<br>
        If a member reached 35 years of credited service prior to January 1, 2021, their credited service will be capped at
        35 years. (Also - see Benefit Calculation Changes below)<br></span>
        <span class="cls_009">Disability Pension</span><span class="cls_002">: Unreduced pension at any age if total and permanently disabled based on credited service.
        Integrated at age 65. For pre-2005 disability pensions immediate integration if in receipt of CPP disability pension.</span>
    </td></tr>
<tr><td><span class="cls_002">Age when bridging or supplemental benefits end</span>
</td><td><span class="cls_002">Earlier of age 65 or on death of member.</span>
</td></tr>
        <tr><td><span class="cls_002">Consent benefits</span></td>
        <td><span class="cls_002">n/a</span></td></tr>
<tr><td><span class="cls_002">Minimum benefit formula</span>
</td>
<td><span class="cls_002">n/a</span></td></tr>
        <tr><td><span class="cls_002">Plan Member contribution formula</span></td>
        <td><span class="cls_002">https://www.omers.com/contributions-and-pa-calculators</span></td></tr>
        <tr><td valign = "top"><span class="cls_002">Indexation (pre-retirement)</span></td>
            <td><span class="cls_002">Benefits earned on or before December 31, 2022 receive full indexation based on a measure of CPI up to a
                maximum increase of 6%. Any excess is carried forward so it can be used in later years when the CPI increase is
                less than 6%.
                Benefits earned on or after January 1, 2023 are subject to Shared Risk Indexing, meaning that the level of inflation
                protection will depend on the OMERS Sponsors Corporation Board’s annual assessment of the financial health of
                the OMERS Plan.<br></span>
                <span class="cls_010">(Also - see Benefit Calculation Changes </span><span
                        class="cls_002">below</span><span class="cls_010">)</span>

            </td></tr>
        <tr><td valign = "top"><span class="cls_002">Indexation (post-retirement)</span></td>
        <td><span class="cls_002">Same as Pre-Retirement</span></td></tr>
        <tr><td valign = "top"><span class="cls_002">Other relevant provisions - Benefit Calculation Changes</span></td>
        <td><span class="cls_002">If the member is not eligible to retire at the relevant calculation date, the benefit will be calculated in two parts:<br>
            <span style="padding-left: 8pt">•</span>
            <span style="padding-left: 8pt">The benefit based on pre-2013 credited service includes pre-retirement indexing and early </span> <span style="padding-left: 21pt">retirement subsidies (including the bridge benefit).<br></span>
            <span style="padding-left: 8pt">•</span>
            <span style="padding-left: 8pt">The benefit based on post-2012 credited service does not include pre-retirement indexing or early </span> <span style="padding-left: 21pt">retirement subsidies (i.e. actuarial equivalent reduction from NRD and no bridge benefit).
            </span></span></td></tr></table>


</div>






    <div style="position:fixed;left:7pt;bottom:6pt" class="cls_002"><span class="cls_002">OMERS, EY Tower, 900 - 100 Adelaide St W, Toronto, ON  M5H 0E2</span>
    </div>
    <div style="position:fixed;right:8pt;bottom:-1pt" class="cls_002"><span class="cls_002">Feb. 2022</span>
    </div>
    <div style="position:fixed;left:7pt;bottom:-1pt" class="cls_002"><span class="cls_002">T +1 416.369.2444  +1 800.387.0813</span>
    </div>

</div>
</body>
</html>
', true, 1, 'dms_template', current_timestamp);



insert into dmstemplate.template_history (audit_id,template_id, process_id, template_name, template_type, approved_by, modified_by,
                                  modified_on, template_fields, template_data, is_active, version, created_by,
                                  created_on)
values ('2963368e-12d7-44f8-939b-d5d007ea54db','6ffd6a5a-198e-11ed-861d-0242ac120005', 'SAD', 'FLV_PlanProvisions4B_NRA60_vf_2022_Template', 'HTML', '', 'dms_template',
        current_timestamp, '[]',
        '<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css">

        @page :first {
            size: 8.50 *11.00in;
            margin: 8mm;
        }

        table, th, td {
            border: 1pt solid;
            border-collapse: collapse;
        }

        td {
            padding: 0pt 0pt 2pt 4pt;
        }

        th {
            text-align: center;
        }

        table {
            width: auto;
        }

        tr {
            line-height: 8pt;
        }

        span.cls_003 {
            font-family: Arial, serif;
            font-size: 14.4pt;
            color: rgb(0, 0, 0);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }

        div.cls_003 {
            position: absolute;
            right: 8pt;
            top: 56.51pt;
        }

        span.cls_004 {
            font-family: Arial, serif;
            font-size: 13.2pt;
            color: rgb(0, 0, 0);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }

        div.cls_004 {
            position: absolute;
            right: 8pt;

        }

        span.cls_005 {
            font-family: Arial, serif;
            font-size: 11.4pt;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }

        div.cls_005 {
            position: absolute;
            right: 8pt;
            top: 99.28pt
        }

        span.cls_006 {
            font-family: Arial, serif;
            font-size: 11.4pt;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: italic;
            text-decoration: none
        }


        span.cls_007 {
            font-family: Arial, serif;
            font-size: 8pt;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }

        span.cls_012 {
            font-family: Arial, serif;
            font-size: 6.1pt;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: normal;
            text-decoration: underline
        }


        span.cls_008 {
            font-family: Arial, serif;
            font-size: 8pt;
            color: rgb(0, 0, 0);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }


        span.cls_002 {
            font-family: Arial, serif;
            font-size: 8.2pt;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }


        span.cls_013 {
            font-family: Arial, serif;
            font-size: 9.2pt;
            color: rgb(0, 0, 0);
            font-weight: bold;
            font-style: normal;
            text-decoration: underline
        }


        span.cls_010 {
            font-family: Arial, serif;
            font-size: 7.2pt;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: italic;
            text-decoration: none
        }


        span.cls_011 {
            font-family: Arial, serif;
            font-size: 7.5pt;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: italic;
            text-decoration: none
        }

        span.cls_014 {
            font-family: Arial, serif;
            font-size: 8.2pt;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: normal;
            text-decoration: underline
        }


        span.cls_009 {
            font-family: Arial, serif;
            font-size: 7.2pt;
            color: rgb(0, 0, 0);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }

    </style>
</head>
<body>
<div>

    <img src="OMERS_PAGE_LOGO_BW" style="
    position: absolute;
    height: 50pt;
    padding-left: 10pt;
    top: 0pt;

">
    <div class="cls_003"><span class="cls_003">Additional Disclosures - Attachment (NRA 60)</span>
    </div>
    <div style="top:71.51pt" class="cls_004"><span class="cls_004">Explanation of Pension Plan Provisions that Apply to the Plan Member</span>
    </div>
    <div style="top:84.80pt" class="cls_004"><span class="cls_004">to Calculate the Family Law Value</span>
    </div>
    <div class="cls_005"><span class="cls_005">Replacement for Page 9/12 of the </span><span
            class="cls_006">Statement of Family Law Value</span></div>
    <div style=" padding-top: 110pt; ">
        <table>
            <col style="width:37%">
            <col style="width:63%">
            <tr>
                <td colspan="2"><span class="cls_007">The defined benefit provisions of the OMERS Primary Pension Plan are more broadly described in the member handbook found at </span><span
                        class="cls_012">www.omers.com</span></td>
            </tr>
            <tr>
                <th valign="center"> <span
                        class="cls_008">Plan Provisions</span></th>
                <th valign="center"><span class="cls_008">Provide Details (if Applicable)</span>
                </th>
            </tr>
            <tr>
                <td><span class="cls_002">Plan type</span>
                </td>
                <td><span class="cls_002">Jointly Sponsored Pension Plan</span>
                </td>
            </tr>
            <tr>
                <td><span class="cls_002">Benefit type</span>
                </td>
                <td><span class="cls_002">Defined Benefit - Best Average Earnings (BAE): Best 60 consecutive months of contributory earnings</span>
                </td>
            </tr>


            <tr>
                <td valign="top"><span class="cls_002">Pension benefit formula (defined benefit)</span>
                </td>
                <td><span class="cls_013">Normal Retirement Pension:</span>

                    <span class="cls_010">2% x BAE x pre-1966 service + ((1.325% x lesser of AYMPE and BAE) + (2% x [BAE minus AYMPE]) x credited

   service after 1965). </span><span class="cls_002">If a member reached 35 years of credited service on their record prior to January 1, 2021, their credited

    service will be capped at 35 years</span><span
                            class="cls_010">. </span><span class="cls_002">Maximum pension credit prescribed under the ITA applies to credited service

    after 1991<br></span>

                    <span class="cls_011">AYMPE (Final 5) is based average of annual YMPE for the year of termination and the 4 preceding years</span><span
                            class="cls_010">.</span></td>
            </tr>
            <tr>
                <td><span class="cls_002">Canada Pension Plan/Old Age Security offset formula</span></td>

                <td><span class="cls_010">Note - The terms integration/offset/bridge are used interchangeably in OMERS communications.</span>
                </td>
            </tr>

            <tr>
                <td><span class="cls_002">Canada Pension Plan/Old Age Security integration formula (and average YMPE used in the calculation)</span>
                </td>
                <td><span class="cls_014">Unreduced</span><span class="cls_002"> Bridge discontinued at age 65 (See ancillary benefits)</span>
                </td>
            </tr>


            <tr>
                <td valign="top"><span class="cls_002">Normal retirement date (NRD)</span>
                </td>
                <td><span class="cls_002">NRD - End of the month the member turns age 60</span>
                    <br>
                    <span class="cls_002">NRA (Normal retirement age) is attained age 60.</span>
                </td>
            </tr>
            <tr>
                <td valign="top"><span class="cls_002">Early retirement options</span>
                </td>
                <td>
                    <span class="cls_002">Within 10 years of Normal Retirement Age (50) regardless of service.<br></span>


                    <span class="cls_009">Early Retirement Pension:</span><span
                        class="cls_002"> (Normal Retirement Pension plus Bridge [see below]) x Reduction factor
    Benefits are unreduced if member has reached either 60 years of age, 30 years of qualifying service or 85 Factor

   (age + qualifying service).  If the member has not reached the either milestone, then the pension benefit is reduced

   by 5% times number of years the member is from the nearest milestone. <br></span><span
                        class="cls_010">(see Benefit Calculation Changes below)</span></td>
            </tr>

            <tr>
                <td valign="top">
    <span
            class="cls_002">Termination benefit</span></td>
                <td>
    <span class="cls_002">Termination before the member is within 10 years of Normal Retirement Age: Member is entitled to a deferred

    pension.  Optional pre-1987 refund contributions with interest (C+I).</span>
                </td>
            </tr>
            <tr>
                <td valign="top">
    <span
            class="cls_002">Postponed retirement</span></td>
                <td>
    <span class="cls_002">Members who remain in employment beyond NRD continue to accrue service until the earlier of November 30 of

   the year they turn age 71 or 35 years of credited service is achieved, if achieved prior to January 1, 2021.</span>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <span class="cls_002">Pre-retirement death benefit</span>
                </td>
                <td>
    <span class="cls_002">Order of entitlement to survivor benefits sets first in line for benefits, next in line follows the absence or the prior


    survivor (see Plan Member Handbook for greater detail):<br>
    1.
    Eligible spouse - 66 2/3% (normal retirement pension) plus 10% (normal retirement pension) per <span
                style="padding-left: 9pt"> eligible

            dependent child (max 100% normal retirement pension).  Optional refund based on value of </span><span
                style="padding-left: 9pt">member pension

   at death (pre-1987 C+I, post-1986 commuted value).<br>

    2.
    Eligible children - 66 2/3% normal retirement pension shared among eligible dependent children.<br>

    3.
   Living designated beneficiary:  Refund based on value of member’s pension at death.<br>

    4.
        Estate: Refund based on value of member’s pension at death.</span></span>

                </td>
            </tr>
            <tr>
                <td><span class="cls_002">Normal form of pension</span>
                </td>
                <td><span class="cls_002">Joint and Survivor 66 2/3% (no optional forms)</span>
                </td>
            </tr>
            <tr>
                <td valign="top">
        <span class="cls_002">Ancillary benefits (bridging, supplemental, disability,

        etc.)</span></td>

                <td>
                    <span class="cls_009">Bridge (see CPP Integration)</span><span
                        class="cls_002">: Formula (</span><span
                        class="cls_010">Also - see Benefit Calculation Changes </span><span
                        class="cls_002">below)</span><br>

                    <span class="cls_002">0.675% * AYMPE x credited service after 1965 (</span><span
                        class="cls_014">reduced</span><span class="cls_002"> as part of “Early Retirement Formula”).<br>
        If a member reached 35 years of credited service on their record prior to January 1, 2021, their credited service will be capped at
        35 years. (Also - see Benefit Calculation Changes below)<br></span>
                    <span class="cls_009">Disability Pension</span><span class="cls_002">: Unreduced pension at any age if total and permanently disabled based on credited service
        Integrated at age 65. For pre-2005 disability pensions immediate integration if in receipt of CPP disability pension.</span>
                </td>
            </tr>
            <tr>
                <td><span class="cls_002">Age when bridging or supplemental benefits end</span>
                </td>
                <td><span class="cls_002">Earlier of age 65 or on death of member.</span>
                </td>
            </tr>
            <tr>
                <td><span class="cls_002">Consent benefits</span></td>
                <td><span class="cls_002">n/a</span></td>
            </tr>
            <tr>
                <td><span class="cls_002">Minimum benefit formula</span>
                </td>
                <td><span class="cls_002">n/a</span></td>
            </tr>
            <tr>
                <td><span class="cls_002">Plan Member contribution formula</span></td>
                <td><span class="cls_002"><a>https://www.omers.com/contributions-and-pa-calculators</a></span></td>
            </tr>
            <tr>
                <td valign="top"><span class="cls_002">Indexation (pre-retirement)</span></td>
                <td><span class="cls_002">Benefits earned on or before December 31, 2022 receive full indexation based on a measure of CPI, up to a
                maximum increase of 6%. Any excess is carried forward so it can be used in later years when the CPI increase is
                less than 6%.
                Benefits earned on or after January 1, 2023 are subject to Shared Risk Indexing, meaning that the level of inflation
                protection will depend on the OMERS Sponsors Corporation Board’s annual assessment of the financial health of
                the OMERS Plan.<br></span>
                    <span class="cls_010">(Also see Benefit Calculation Changes </span><span
                            class="cls_002">below</span><span class="cls_010">)</span>

                </td>
            </tr>
            <tr>
                <td valign="top"><span class="cls_002">Indexation (post-retirement)</span></td>
                <td><span class="cls_002">Same as Pre-Retirement</span></td>
            </tr>
            <tr>
                <td valign="top"><span class="cls_002">Other relevant provisions - Benefit Calculation Changes</span>
                </td>
                <td><span class="cls_002">If the member is not eligible to retire at the FLV date, the benefit will be calculated in two parts:<br>
            <span style="padding-left: 8pt">•</span>
            <span style="padding-left: 8pt">The benefit based on pre-2013 credited service includes pre-retirement indexing and early </span> <span
                            style="padding-left: 21pt">retirement subsidies (including the bridge benefit).<br></span>
            <span style="padding-left: 8pt">•</span>
            <span style="padding-left: 8pt">The benefit based on post-2012 credited service does not include pre-retirement indexing or early </span> <span
                            style="padding-left: 21pt">retirement subsidies (i.e., actuarial equivalent pension and bridge from NRD).
            </span></span></td>
            </tr>
        </table>


    </div>


    <div style="position:fixed;left:7pt;bottom:6pt" class="cls_002"><span class="cls_002">OMERS, EY Tower, 900 - 100 Adelaide St W, Toronto, ON  M5H 0E2</span>
    </div>
    <div style="position:fixed;right:8pt;bottom:-1pt" class="cls_002"><span class="cls_002">Feb. 2022</span>
    </div>
    <div style="position:fixed;left:7pt;bottom:-1pt" class="cls_002"><span class="cls_002">T +1 416.369.2444  +1 800.387.0813</span>
    </div>

</div>
</body>
</html>', true, 1, 'dms_template', current_timestamp);



insert into dmstemplate.template_history (audit_id, template_id, process_id, template_name, template_type, approved_by, modified_by,
                                  modified_on, template_fields, template_data, is_active, version, created_by,
                                  created_on)
values ('c94cc4e3-ed83-4716-b75e-c7382e90753c','6ffd6a5a-198e-11ed-861d-0242ac120006', 'SAD', 'FLV_PlanProvisons4D_NRA60_Template', 'HTML', '', 'dms_template',
        current_timestamp, '[]',
        '<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css">

        @page :first {
            size: 8.50 *11.00in;
            margin: 8mm;
        }

        table, th, td {
            border: 1pt solid;
            border-collapse: collapse;
        }

        td {
            padding: 0pt 0pt 2pt 4pt;
        }

        th {
            text-align: center;
        }

        table {
            width: auto;
        }

        tr {
            line-height: 8pt;
        }

        span.cls_003 {
            font-family: Arial, serif;
            font-size: 14.4pt;
            color: rgb(0, 0, 0);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }

        div.cls_003 {
            position: absolute;
            right: 8pt;
            top: 56.51pt;
        }

        span.cls_004 {
            font-family: Arial, serif;
            font-size: 13.2pt;
            color: rgb(0, 0, 0);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }

        div.cls_004 {
            position: absolute;
            right: 8pt;

        }

        span.cls_005 {
            font-family: Arial, serif;
            font-size: 11.4pt;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }

        div.cls_005 {
            position: absolute;
            right: 8pt;
            top: 99.28pt
        }

        span.cls_006 {
            font-family: Arial, serif;
            font-size: 11.4pt;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: italic;
            text-decoration: none
        }


        span.cls_007 {
            font-family: Arial, serif;
            font-size: 8pt;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }

        span.cls_012 {
            font-family: Arial, serif;
            font-size: 6.1pt;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: normal;
            text-decoration: underline
        }


        span.cls_008 {
            font-family: Arial, serif;
            font-size: 8pt;
            color: rgb(0, 0, 0);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }


        span.cls_002 {
            font-family: Arial, serif;
            font-size: 8.2pt;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }


        span.cls_013 {
            font-family: Arial, serif;
            font-size: 9.2pt;
            color: rgb(0, 0, 0);
            font-weight: bold;
            font-style: normal;
            text-decoration: underline
        }


        span.cls_010 {
            font-family: Arial, serif;
            font-size: 7.2pt;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: italic;
            text-decoration: none
        }


        span.cls_011 {
            font-family: Arial, serif;
            font-size: 7.5pt;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: italic;
            text-decoration: none
        }

        span.cls_014 {
            font-family: Arial, serif;
            font-size: 8.2pt;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: normal;
            text-decoration: underline
        }


        span.cls_009 {
            font-family: Arial, serif;
            font-size: 7.2pt;
            color: rgb(0, 0, 0);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }
    </style>
</head>
<body>
<div>
    <img src="OMERS_PAGE_LOGO_BW" style="
    position: absolute;
    height: 50pt;
    padding-left: 10pt;
    top: 0pt;

">
    <div class="cls_003"><span class="cls_003">Additional Disclosures - Attachment (NRA 60)</span>
    </div>
    <div style="top:71.51pt"  class="cls_004"><span class="cls_004">Explanation of Pension Plan Provisions that Apply to the Former Member</span>
    </div>
    <div style="top:84.80pt" class="cls_004"><span class="cls_004">to Calculate the Family Law Value</span>
    </div>
    <div class="cls_005"><span class="cls_005">Replacement for Page 10/13 of the </span><span
            class="cls_006">Statement of Family Law Value</span></div>
    <div style=" padding-top: 110pt; ">
    <table><col style="width:37%">
        <col style="width:63%">
    <tr><td colspan="2"><span class="cls_007">The defined benefit provisions of the OMERS Primary Pension Plan are more broadly described in the member handbook found at </span><span
            class="cls_012">www.omers.com</span></td></tr>
   <tr><th valign = "center"> <span
           class="cls_008">Plan Provisions</span></th>
    <th valign = "center"><span class="cls_008">Provide Details (if Applicable)</span>
    </th></tr>
   <tr><td><span class="cls_002">Plan type</span>
  </td>
   <td><span class="cls_002">Jointly Sponsored Pension Plan</span>
   </td></tr>
   <tr><td><span class="cls_002">Benefit type</span>
   </td><td><span class="cls_002">Defined Benefit - Best Average Earnings (BAE): Best 60 consecutive months of contributory earnings</span>
   </td></tr>


   <tr><td valign = "top"><span class="cls_002">Pension benefit formula (defined benefit)</span>
   </td>
    <td><span class="cls_013">Normal Retirement Pension:</span>

    <span class="cls_010">2% x BAE x pre-1966 service + ((1.325% x lesser of AYMPE and BAE) + (2% x [BAE minus AYMPE]) x credited

   service after 1965). </span><span class="cls_002">If a member reached 35 years of credited service on their record prior to January 1, 2021, their credited

    service will be capped at 35 years</span><span
            class="cls_010">. </span><span class="cls_002">Maximum pension credit prescribed under the ITA applies to credited service

    after 1991<br></span>

    <span class="cls_011">AYMPE (Final 5) is based average of annual YMPE for the year of termination and the 4 preceding years</span><span
            class="cls_010">.</span></td></tr>
    <tr><td> <span class="cls_002">Canada Pension Plan/Old Age Security offset formula</span></td>

        <td><span class="cls_010">Note - The terms integration/offset/bridge are used interchangeably in OMERS communications.</span></td></tr>

 <tr><td><span class="cls_002">Canada Pension Plan/Old Age Security integration formula (and average YMPE used in the calculation)</span>
 </td>
    <td><span class="cls_014">Unreduced</span><span class="cls_002"> Bridge discontinued at age 65 (See ancillary benefits)</span>
    </td></tr>


   <tr><td valign = "top"><span class="cls_002">Normal retirement date (NRD)</span>
   </td>
    <td><span class="cls_002">NRD - End of the month the member turns age 60</span>
<br>
    <span class="cls_002">NRA (Normal retirement age) is attained age 60.</span>
    </td></tr>
        <tr><td valign = "top"><span class="cls_002">Early retirement options</span>
        </td>
    <td>
    <span class="cls_002">Within 10 years of Normal Retirement Age (50) regardless of service.<br></span>


    <span class="cls_009">Early Retirement Pension:</span><span
            class="cls_002"> (Normal Retirement Pension plus Bridge [see below]) x Reduction factor
    Benefits are unreduced if member has reached either 60 years of age, 30 years of qualifying service or 85 Factor

   (age + qualifying service).  If the member has not reached the either milestone, then the pension benefit is reduced

   by 5% times number of years the member is from the nearest milestone. </span><span
            class="cls_010">(see Benefit Calculation Changes below)</span></td></tr>

  <tr><td valign = "top">
    <span
            class="cls_002">Termination benefit</span></td>
      <td>
    <span class="cls_002">Termination before the member is within 10 years of Normal Retirement Age: Member is entitled to a deferred

    pension.  Optional pre-1987 refund contributions with interest (C+I).</span>
    </td></tr>
        <tr>
    <td valign = "top">
    <span
            class="cls_002">Postponed retirement</span></td>
        <td>
    <span class="cls_002">Members who remain in employment beyond NRD continue to accrue service until the earlier of November 30 of

   the year they turn age 71 or 35 years of credited service is achieved, if achieved prior to January 1, 2021.</span>
        </td></tr>
        <tr><td valign = "top">
        <span class="cls_002">Pre-retirement death benefit</span>
        </td>
   <td>
    <span class="cls_002">Order of entitlement to survivor benefits sets first in line for benefits, next in line follows the absence or the prior


    survivor (see Plan Member Handbook for greater detail):<br>
    1.
    Eligible spouse - 66 2/3% (normal retirement pension) plus 10% (normal retirement pension) per <span style="padding-left: 9pt" > eligible

            dependent child (max 100% normal retirement pension).  Optional refund based on value of </span><span style="padding-left: 9pt">member pension

   at death (pre-1987 C+I, post-1986 commuted value).<br>

    2.
    Eligible children - 66 2/3% normal retirement pension shared among eligible dependent children.<br>

    3.
   Living designated beneficiary:  Refund based on value of member’s pension at death.<br>

    4.
        Estate: Refund based on value of member’s pension at death.</span></span>

   </td></tr>
    <tr><td><span class="cls_002">Normal form of pension</span>
    </td><td><span class="cls_002">Joint and Survivor 66 2/3% (no optional forms)</span>
    </td></tr>
        <tr>
        <td valign="top">
        <span class="cls_002">Ancillary benefits (bridging, supplemental, disability,

        etc.)</span></td>

    <td>
    <span class="cls_009">Bridge (see CPP Integration)</span><span
            class="cls_002">: Formula (</span><span class="cls_010">Also-see Benefit Calculation Changes </span><span
            class="cls_002">below)</span><br>

    <span class="cls_002">0.675% * AYMPE x credited service after 1965 (</span><span
            class="cls_014">reduced</span><span class="cls_002"> as part of “Early Retirement Formula”).<br>
        If a member reached 35 years of credited service on their record prior to January 1, 2021, their credited service will be capped at
        35 years. (Also - see Benefit Calculation Changes below)<br></span>
        <span class="cls_009">Disability Pension</span><span class="cls_002">: Unreduced pension at any age if total and permanently disabled based on credited service
        Integrated at age 65. For pre-2005 disability pensions immediate integration if in receipt of CPP disability pension.</span>
    </td></tr>
<tr><td><span class="cls_002">Age when bridging or supplemental benefits end</span>
</td><td><span class="cls_002">Earlier of age 65 or on death of member.</span>
</td></tr>
        <tr><td><span class="cls_002">Consent benefits</span></td>
        <td><span class="cls_002">n/a</span></td></tr>
<tr><td><span class="cls_002">Minimum benefit formula</span>
</td>
<td><span class="cls_002">n/a</span></td></tr>
        <tr><td><span class="cls_002">Plan Member contribution formula</span></td>
            <td><span class="cls_002"><a>https://www.omers.com/contributions-and-pa-calculators</a></span></td></tr>
        <tr><td valign = "top"><span class="cls_002">Indexation (pre-retirement)</span></td>
            <td><span class="cls_002">Benefits earned on or before December 31, 2022 receive full indexation based on a measure of CPI, up to a
                maximum increase of 6%. Any excess is carried forward so it can be used in later years when the CPI increase is
                less than 6%.
                Benefits earned on or after January 1, 2023 are subject to Shared Risk Indexing, meaning that the level of inflation
                protection will depend on the OMERS Sponsors Corporation Board’s annual assessment of the financial health of
                the OMERS Plan.<br></span>
                <span class="cls_010">(Also see Benefit Calculation Changes </span><span
                        class="cls_002">below</span><span class="cls_010">)</span>

            </td></tr>
        <tr><td valign = "top"><span class="cls_002">Indexation (post-retirement)</span></td>
        <td><span class="cls_002">Same as Pre-Retirement</span></td></tr>
        <tr><td valign = "top"><span class="cls_002">Other relevant provisions - Benefit Calculation Changes</span></td>
        <td><span class="cls_002">If the member is not eligible to retire at the FLV date, the benefit will be calculated in two parts:<br>
            <span style="padding-left: 8pt">•</span>
            <span style="padding-left: 8pt">The benefit based on pre-2013 credited service includes pre-retirement indexing and early </span> <span style="padding-left: 21pt">retirement subsidies (including the bridge benefit).<br></span>
            <span style="padding-left: 8pt">•</span>
            <span style="padding-left: 8pt">The benefit based on post-2012 credited service does not include pre-retirement indexing or early </span> <span style="padding-left: 21pt">retirement subsidies (i.e., actuarial equivalent pension and bridge from NRD).
            </span></span></td></tr></table>


</div>






    <div style="position:fixed;left:7pt;bottom:6pt" class="cls_002"><span class="cls_002">OMERS, EY Tower, 900 - 100 Adelaide St W, Toronto, ON  M5H 0E2</span>
    </div>
    <div style="position:fixed;right:8pt;bottom:-1pt" class="cls_002"><span class="cls_002">Feb. 2022</span>
    </div>
    <div style="position:fixed;left:7pt;bottom:-1pt" class="cls_002"><span class="cls_002">T +1 416.369.2444  +1 800.387.0813</span>
    </div>

</div>
</body>
</html>', true, 1, 'dms_template', current_timestamp);



insert into dmstemplate.template_history (audit_id,template_id, process_id, template_name, template_type, approved_by, modified_by,
                                  modified_on, template_fields, template_data, is_active, version, created_by,
                                  created_on)
values ('074c813d-eb37-4630-93da-716a86c96e87','6ffd6a5a-198e-11ed-861d-0242ac120007', 'SAD', 'FLV_MailerPage_Template', 'HTML', '', 'dms_template',
        current_timestamp, '[
        {
            "fieldName": "name",
            "fieldType": "STRING",
            "defaultValue": "",
            "isRequired": true
        },
        {
            "fieldName": "address",
            "fieldType": "STRING",
            "defaultValue": "",
            "isRequired": true
        },
        {
            "fieldName": "address2",
            "fieldType": "STRING",
            "defaultValue": "",
            "isRequired": false
        },
        {
            "fieldName": "city",
            "fieldType": "STRING",
            "defaultValue": "",
            "isRequired": true
        },
        {
            "fieldName": "provinceState",
            "fieldType": "STRING",
            "defaultValue": "",
            "isRequired": false
        },
        {
            "fieldName": "postalZip",
            "fieldType": "STRING",
            "defaultValue": "",
            "isRequired": true
        },
        {
            "fieldName": "country",
            "fieldType": "STRING",
            "defaultValue": "",
            "isRequired": true
        }
    ]',
        '<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <style type="text/css">
            @page {
                size: A4 landscape;
                margin: 0mm 25.4mm 0mm 25.4mm;
            }

            html {
                size: A4 landscape;
                margin: 0mm 25.4mm 0mm 25.4mm;
                font-size: 11px;
                font-family: Arial, Helvetica, sans-serif;
            }
            body {
                margin: 0 !important;
            }
            body > #content {
                margin-left: 11.43cm;
                margin-top: 12.6cm;
                font-size: 11;
                font-family: Arial, Helvetica, sans-serif;
            }
            .bold {
                font-weight: bold;
            }
            @media print {
                #content,
                html {
                    size: A4 landscape;
                    margin: 0mm 25.4mm 0mm 25.4mm;
                }
                body {
                    margin: 0 !important;
                }
            }
        </style>
    </head>
    <body>
        <div id="header"></div>

        <div id="content">
            <span class="bold">${name}</span><br>
            <span class="bold">${address}</span><br>
            <#if address2?has_content>
            <span class="bold">${address2}</span><br>
            </#if>
            ${city}<#if provinceState?has_content>, ${provinceState}</#if>, ${postalZip}, ${country}
        </div>

        <div id="footer"></div>
    </body>
</html>', true, 1, 'dms_template', current_timestamp);



insert into dmstemplate.template_history (audit_id,template_id, process_id, template_name, template_type, approved_by, modified_by,
                                  modified_on, template_fields, template_data, is_active, version, created_by,
                                  created_on)
values ('dd65f44e-5e9b-4efd-82c3-029c078202a0','6ffd6a5a-198e-11ed-861d-0242ac120009', 'SAD', 'FLV_TransferChecklistInsert_Template', 'HTML', '', 'dms_template',
        current_timestamp, '[
        {
            "defaultValue": false,
            "fieldName": "block1field1",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "block1field2",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "block1field3",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "block1field4",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "block1field5",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "block2field1",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "block2field2",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "block2field3",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "block3field1",
            "fieldType": "BOOLEAN",
            "isRequired": false
        },
        {
            "defaultValue": false,
            "fieldName": "block3field2",
            "fieldType": "BOOLEAN",
            "isRequired": false
        }
    ]',
        '<!DOCTYPE html>
<html>
    <head>
        <style type="text/css">
            @page {
                size: 215.9mm 279.4mm;
                margin: 0 0 0 0 !important;
                padding-top: 0 !important;
            }
            @media print {
                body,
                section[size="A4"] {
                    size: 215.9mm 279.4mm;
                    padding: 0;
                    margin: 0;
                    box-shadow: 0;
                }
                .content {
                    display: block;
                    overflow: hidden;
                    width: 189.6mm;
                }
            }
            @media screen {
                body {
                    background: rgb(204, 204, 204);
                }
                section {
                    background: white;
                    box-shadow: 0 0 0.5cm rgba(0, 0, 0, 0.5);
                }
                section > .horizontalMargins {
                    padding: 10.9mm 0 14.5mm 0 !important;
                }
            }
            body {
                margin-left: auto;
                margin-right: auto;
            }
            section {
                display: block;
                margin: 0 auto;
                margin-bottom: 0.5cm;
            }
            section[size="A4"] {
                width: 215.9mm;
                height: 279.4mm;
                position: relative;
            }
            section > .horizontalMargins {
                margin: 0mm 13.15mm 0mm 13.15mm;
                max-width: 100%;
                display: block;
                padding: 10.9mm 0 14.5mm 0 !important;
            }
            .content {
                font-size: 10pt;
                font-family: Arial, Helvetica, sans-serif;
            }
            .bold {
                font-weight: bold;
            }
            .greySection {
                margin-top: 10px;
                font-size: 10.2pt;
                padding: 5px 10px 15px 10px;
                margin-left: -1px;
                width:186mm;
                background-color: #f1f1f1;
            }
            .container {
                display: inline-block;
                position: relative;
                margin-left: 15pt;
                padding-left: 20pt;
                cursor: pointer;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
                margin-top:3pt;
            }
            .checkmark {
                position: absolute;
                top: 0;
                left: 0;
            }
            .footerBottom {
                margin-top: 10px;
                text-align: center;
            }
            .footerLeft {
                float: left;
                text-align: left;
            }
            .pageFooter {
                font-family: Arial, Helvetica, sans-serif;
                font-size: 10px;
                bottom: 20pt;
                position: absolute;
                border-top: 1px solid #000;
                width: 189.6mm;
                margin-left: 13.15mm;
                margin-right: 13.15mm;
            }
            .subtext{
                font-size: 7.8pt;
            }
            .omersBlue{
                font-size: 14pt;
                font-weight: bold;
                color: #003A70;
                margin-top:5pt;
                margin-bottom:5pt;
                margin-left:10pt;
            }
            .omersLogo{
                text-align: right;
            }
            .sideBySide{
                display: block;
                width:100%;
                padding: 10pt 0 10pt 0;
            }
            .leftSide{
                display: inline-block;
                width: 15%;
                vertical-align: middle;
            }
            .rightSide{
                display: inline-block;
                width: 454pt;
                vertical-align: middle;
            }
            .headerOverlay{
                font-family: Arial, Helvetica, sans-serif;
                color:#fff;
                font-size:22pt;
                font-weight: bold;
                vertical-align: middle;
                height:35pt;
                margin:55pt 10pt 95pt 55pt;
                position: absolute;
                width: 215.9mm;
                top:0;
            }
            .headerContainer{
                position: relative;
                width: 100%;
            }
            .bottom{
                position:absolute;
                bottom:-499pt;
                left:30pt;
                width:50mm;
                font-size:8pt
            }
        </style>
    </head>
    <body>
        <section size="A4">
            <span class="headerContainer">
                <img src="FULL_PAGE_BG" style="width:215.9mm; height:278.4mm; display:block">
                <div class="headerOverlay">
                    <img src="CHECK_MARK" style="width:24pt; display:inline-block; vertical-align: middle; padding-right:5pt">
                    <span style="margin-top:-1pt; margin-left:27pt; position:absolute;">Family Law Value Transfer Checklist</span>
                </div>
            </span>
            <span class="horizontalMargins" style="padding: 0 0 14.5mm 0 !important; position:absolute; top:170pt">
                <span class="content">
                    <div>
                        <div class="omersBlue">
                            A Plan member’s former spouse can use this checklist if proceeding with a transfer of the
                            Family Law Value (FLV).
                        </div>
                    </div>
                    <div class="sideBySide">
                        <span class="leftSide"></span>
                        <span class="rightSide">
                        <div class="bold" style="top: 65pt; left:60pt; font-size:10.5pt; position:absolute">
                            Be sure to provide all three of the required documents below. Submitting an incomplete
                            application can significantly delay the process.
                        </div>
                    </span>
                    </div>
                    <div class="greySection" style="top: 110pt; position:absolute">
                        <div class="bold">
                            1. Marriage breakdown document (i.e., court order, domestic contract, family arbitration
                            award)
                        </div>

                        <div>
                            <label class="container">
                                <#if block1field1==true><span class="checkmark"><input type="checkbox" checked="checked"/></span><#else><span class="checkmark"><input type="checkbox"/></span></#if>
                                <span>Executed on or after January 1, 2012 under the Ontario <i>Family Law Act</i>;</span>
                            </label>
                        </div>
                        <div>
                            <label class="container">
                                <#if block1field2==true><span class="checkmark"><input type="checkbox" checked="checked"/></span><#else><span class="checkmark"><input type="checkbox"/></span></#if>
                                <span>Clearly specifies the transfer amount or percentage of the FLV to be paid from OMERS to the former spouse (for each membership, if applicable);</span>
                            </label>
                        </div>
                        <div>
                            <label class="container">
                                <#if block1field3==true><span class="checkmark"><input type="checkbox" checked="checked"/></span><#else><span class="checkmark"><input type="checkbox"/></span></#if>
                                <span>States the FLV Date that matches the date in the enclosed <i>Statement of Family Law Value;</i></span>
                            </label>
                        </div>
                        <div>
                            <label class="container">
                                <#if block1field4==true><span class="checkmark"><input type="checkbox" checked="checked"/></span><#else><span class="checkmark"><input type="checkbox"/></span></#if>
                                <span>Certified as a true copy of the original document by a lawyer,commissioner of oaths or notary public; and,</span>
                            </label>
                        </div>
                        <div>
                            <label class="container">
                                <#if block1field5==true><span class="checkmark"><input type="checkbox" checked="checked"/></span><#else><span class="checkmark"><input type="checkbox"/></span></#if>
                                <span>A complete copy of the marriage breakdown document has been provided.</span>
                            </label>
                        </div>
                    </div>
                    <div class="greySection"style="top: 228pt; position:absolute">
                        <div class="bold"><i>2. Spouse''s Application for Transfer of a Lump Sum*</i></div>
                        <div>
                            <label class="container">
                                <#if block2field1==true><span class="checkmark"><input type="checkbox" checked="checked"/></span><#else><span class="checkmark"><input type="checkbox"/></span></#if>
                                <span>Parts A to D completed by the former spouse of the Plan member;</span>
                            </label>
                        </div>
                        <div><label class="container">
                                <#if block2field2==true><span class="checkmark"><input type="checkbox" checked="checked"/></span><#else><span class="checkmark"><input type="checkbox"/></span></#if>
                                <span>Part E completed with thefinancial institution information or Part F completed with the pension plan information; and,</span>
                            </label>
                        </div>
                        <div>
                            <label class="container">
                                <#if block2field3==true><span class="checkmark"><input type="checkbox" checked="checked"/></span><#else><span class="checkmark"><input type="checkbox"/></span></#if>
                                <span>Part H signed and dated by the former spouse of the Plan member.</span>
                            </label>
                        </div>
                        <div>
                            <span class="subtext">* This form is available on the Financial Services Regulatory Authority of Ontario (FSRA) website at fsrao.ca/industry/pensions/pensions-forms#family</span>
                        </div>
                    </div>
                    <div class="greySection"style="top: 328pt; position:absolute">
                        <div class="bold">3. Direction to administrator</div>
                        <div>
                            <label class="container">
                                <#if block3field1==true><span class="checkmark"><input type="checkbox" checked="checked"/></span><#else><span class="checkmark"><input type="checkbox"/></span></#if>
                                <span>Sections 1 and 2 completed by the former spouse of the Plan member with their information; and,</span>
                            </label>
                        </div>
                        <div>
                            <label class="container">
                                <#if block3field2==true><span class="checkmark"><input type="checkbox" checked="checked"/></span><#else><span class="checkmark"><input type="checkbox"/></span></#if>
                                <span>Section 4 completed and signed by the financial institution.</span>
                            </label>
                        </div>
                    </div>
                    <div style="top: 400pt; position:absolute">
                        <div class="bold">IMPORTANT</div>
                        <ul style="margin-top:0">
                            <li>
                                If the start date of spousal relationship is included in the marriage breakdown document, it
                                must match the start date listed in the enclosed <i>Statement of Family Law Value</i>.
                            </li>
                            <li>
                                Please refer
                                to page four of the enclosed <i>Statement of Family Law Value</i> for guidance on how interest is or is
                                not included in a settlement transfer from the Plan.
                            </li>
                        </ul>
                    </div>
                    <div class="sideBySide" style="top: 470pt; left:-25pt; position:absolute">
                        <span class="leftSide"></span>
                        <span class="rightSide">
                            <div class="bold">Return all documents to OMERS using one of the following:</div>
                            <div><span class="bold">Fax:</span> +1 416.369.9704 or +1 877.369.9704</div>
                            <div>
                                <span class="bold">Mail:</span> EY Tower | 900 – 100 Adelaide St W | Toronto, ON M5H 0E2
                            </div>
                        </span>
                    </div>
                    <div class="bottom">
                        02/22
                    </div>
                </span>
            </span>
        </section>
    </body>
</html>', true, 1, 'dms_template', current_timestamp);




insert into dmstemplate.template_history (audit_id,template_id, process_id, template_name, template_type, approved_by, modified_by,
                                  modified_on, template_fields, template_data, is_active, version, created_by,
                                  created_on)
values ('e784be6f-4a31-43e8-a79b-eba02512d570','6ffd6a5a-198e-11ed-861d-0242ac120011', 'COMMON', 'Reusable_header', 'HTML', '', 'dms_template',
        current_timestamp, '[]',
        '<style type="text/css" >
        @page :first {
            size: A4 portrait;
            margin: 16mm;
            padding-top: 20px;
            padding-bottom: 20px;
            @top-center {
                content: element(pageHeaderFirst);
            };
        }

        @page {
            size: A4 portrait;
            margin: 16mm;
            padding-top: 20px;
            padding-bottom: 20px;
            @top-center {
                content: element(pageHeader);
            };
            @bottom-center {
                content: element(pageFooter);

            };
        }
        #pageHeaderFirst{
            position: running(pageHeaderFirst);
        }
        #pageHeader{
            position: running(pageHeader);
        }
        #pageFooter {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 8px;
            color:#b1acac;
            height : 50px;
            width:100%;
            position: running(pageFooter);
        }
        #pageNumber:before {
            content: counter(page)
        }
        #pageCount:before{
            content: counter(pages)
        }

        html, body {
            size: A4 portrait;
            margin: 16mm;
            font-size: 15px;
            font-family: Arial, Helvetica, sans-serif;
        }
        .headerLeft{
            padding-top: -10px;
            float:left;
            font-family: Arial, Helvetica, sans-serif;
        }
        .headerRight{
            font-size:14px;
            float:right;
            font-family: Arial, Helvetica, sans-serif;
        }
        .headerRight hr{
            width:165px;
            margin:0;
        }
        .marginTop0{
            margin-top: 0px;
        }
        .marginBottom0{
            margin-bottom: 0px;
        }
        .h3Style{
            margin-bottom:0px;
            margin-left:15px;
        }
        .inlineBlock{
            display:inline-block
        }
        .spanLeftMarginRight{
            float:left;
            margin-right:20px
        }
        .spanLeft{
            float:left;
        }
        .semiBold{
            font-weight: bold;
        }
        .row{
            margin-top:10px;
        }
        .leftColumn {
            float: left;
            width: 33.33%;
        }
        .centerColumn {
            float: left;
            width: 33.33%;
            text-align: center;
        }
        .rightColumn {
            float: left;
            width: 33.33%;
            text-align: right;
        }
        .footerTop {
            width:100%;
            margin-top: -20px;
        }

        .footerBottom {
            font-family: Arial, Helvetica, sans-serif;
            margin-top: 10px;
            text-align: center;
        }
        .footerLeft {
            float: left;
            text-align: left;
        }
        .footerCenter{
            text-align: center;
        }
        .footerRight {
            float: right;
            text-align: right;
        }
        .contentBottom {
            padding-bottom: 50px;
        }
        @media screen {
            #pageHeaderFirst {
                position: absolute;
                width: 100%;
                padding-top: 50px;
                order:1;
            }
            #pageHeader {
                display: none;
            }
            #pageFooterNumber {
                display: none;
            }
            #content{
                order:2;
            }
            #pageFooter {
                order:3;
            }

            .leftColumn, .centerColumn, .rightColumn{
                display:none;
            }

            html, body {
                size: A4 portrait;
                margin:0px;
                display: grid;

            }
        }
        @media all {
            #pageHeaderFirst{
                position: relative;
                width:100%;
            }
            .leftColumn, .centerColumn, .rightColumn{
                display:none;
            }
            #content, .page-break{
                display: block;
                page-break-before: always;
                padding-top: 135px;
                padding-bottom: 25px;
            }
            html, body {
                size: A4 portrait;
                margin:0px;

            }
        }
    </style>

<div id="pageHeaderFirst">
    <span class = headerLeft> <img src="OMERS_HEADER_LOGO_BW" width=''200px''  alt="OMERS"/></span>
    <span class="headerRight">
                Member Experience
                <hr class="marginTop0"/>
                EY Tower<br>
                900 - 100 Adelaide St W<br>
                Toronto, ON, M5H 0E2 | Canada<br>
                <span class="semiBold">T</span> +1 416.369.2444  +1 800.387.0813<br>
                <span class="semiBold">F</span> +1 416.369.9704  +1 877.369.9704</span>
</div>
<div id="pageHeader">
    <span> <img src="OMERS_HEADER_LOGO_BW" width=''185px''  alt="OMERS" id="pensionHeaderLogo2"/></span>
</div>', true, 1, 'dms_template', current_timestamp);




insert into dmstemplate.template_history (audit_id,template_id, process_id, template_name, template_type, approved_by, modified_by,
                                  modified_on, template_fields, template_data, is_active, version, created_by,
                                  created_on)
values ('c8a5a3fd-1e2e-4029-8032-2809812cea72','6ffd6a5a-198e-11ed-861d-0242ac120013', 'SAD', 'FLV_DTA_Template', 'HTML', '', 'dms_template',
        current_timestamp, '[
    {
      "defaultValue": "",
      "fieldName": "socialInsuranceNumber",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "dateOfBirth",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "isMr",
      "fieldType": "BOOLEAN",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "isMrs",
      "fieldType": "BOOLEAN",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "isMs",
      "fieldType": "BOOLEAN",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "isOther",
      "fieldType": "BOOLEAN",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "firstName",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "middleName",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "lastName",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "section1Apt",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "section1Address",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "section1City",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "section1Province",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "section1PostalCode",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "homeNumber",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "mobileNumber",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "email",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "isRegPensionPlan",
      "fieldType": "BOOLEAN",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "nameOfPensionPlan",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "section2Address1",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "section2City1",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "section2Province1",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "section2PostalCode1",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "section2Phone",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "provincialOrFederalRegNumber",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "ccraRegNumber",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "isRRSPorLIRA",
      "fieldType": "BOOLEAN",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "nameOfFinancialInstitution",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "rrspOrLiraAcoountNumber",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "section2Address2",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "section2City2",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "section2Province2",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "section2PostalCode2",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "isAnnuity",
      "fieldType": "BOOLEAN",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "nameOfInsuranceCompany",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "section2Address3",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "section2City3",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "section2Province3",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "section2PostalCode3",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "section3TerminationDate",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "section4AdministratorName",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "section4NameOfFinancialInstitution",
      "fieldType": "STRING",
      "isRequired": false
    },
    {
      "defaultValue": "",
      "fieldName": "section4applicantName",
      "fieldType": "STRING",
      "isRequired": false
    }
  ]',
        '<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html"
      lang="" xml:lang="">
<head>


    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <style type="text/css">

        @page {
            size: letter;
            margin-left: 11mm;
            margin-right: 11mm;
            margin-bottom: 3mm;
            margin-top: 11mm;
        }

        .checkmark {
            top: 0px;
            position: relative;
            transform: scale(1.5);
        }

        @media print {
            div {
                page-break-inside: avoid;
            }
        }

        body {
            line-height: 12px;
            font-size: 8pt;
            font-family: Arial, Helvetica, sans-serif;
        }

        .footer {
            font-size: 10px;
            font-family: Arial, Helvetica, sans-serif;
            color: #000000;
        }

        input {
            border: none;
        }

        table, td, th {
            border: 1px solid black;
            border-collapse: collapse;
        }

        td {
            height: 29px;
        }

        p {
            margin: 0;
            padding: 0;
            width: 100%;
        }

        .heading {
            width: 100%;
            background-color: black;
            color: white;
            font-weight: bold;
            padding: 3px;
        }

        .title {
           /* font-weight: bold;*/
            font-size: 30px;
        }

        .div-footer {
            position: absolute;
            bottom: 0px;
            width: 100%;
        }

    </style>
</head>
<body>
<div id="page1-div" style="position:relative;width:100%;height:980px;">
    <div style="position: relative; width: 100%; height: 57px"><img
            src="OMERS_PAGE_LOGO_BW"
            style="position: absolute;height: 38pt;top: 0pt;"></div>

    <div style="position: relative; width: 100%; height: 38px "><span class="title">Direction to administrator</span>
        <p style="position: relative; padding-top:8px; font-size: 13px">required <i>Pension Benefits Act</i> form for a locked-in commuted value
            transfer</p>
    </div>
    <div style="position:relative; height: 114px; padding-top: 17px; padding-bottom: 13px;">
        <div style="position:relative;width: 49%; float: left">
            <p><b>Use this Ontario <i>Pension Benefits Act</i> (PBA) form to transfer the commuted value of your OMERS
                benefit to a locked-in RRSP, LIRA, annuity or registered pension plan (RPP).</b></p>
            <p style="padding-top: 10px">Complete Sections 1, 2 and 3. The financial institution or pension plan to
                which you are moving your benefit completes Section 4.</p>
            <p style="padding-top: 10px;padding-bottom: 10px"><b>Section 4 must be completed <i>before</i> we can process your
                transfer.</b></p>
            <p>To help us serve you better, submit your documents quickly and securely using your myOMERS account. Go to
                My Communications, start a new conversation, attach your files, and submit.</p>
        </div>
        <div style="width: 47%;position: relative; float: right">
            <p>Any personal information provided on this form may be used to update your membership profile.</p>
            <p style="padding-top: 10px">Providing OMERS with your personal information is considered consent for its
                use and disclosure for the purposes set out in our Privacy Statement, as amended from time to time. You
                can find out more about our collection, use, disclosure and retention of personal information by
                reviewing our Privacy Statement at www.omers.com.</p>
        </div>
    </div>
    <div style="position: relative; width: 100%; top: 23px; height: 18px"><p class="heading" style="float: left">SECTION
        1 - APPLICANT INFORMATION</p></p></div>
    <div style="position: relative; width: 100%; top: 50px">
        <table style="width: 100%">
            <tr style="height: 36px">
                <td valign="top" style="width: 80%">
                    Social Insurance Number<br/>
                    ${socialInsuranceNumber}
                </td>
                <td valign="top" style="width: 20%">
                    Date of Birth (m/d/y)<br/>
                    ${dateOfBirth}
                </td>
            </tr>
        </table>
        <table style="width: 100%">
            <tr style="height: 36px">
                <td style="width: 20%"><label style="padding-right: 20px">
                    <#if isMr==true>
                    <input type="checkbox" checked="checked">
                    <#else>
                    <input type="checkbox">
                    </#if>
                    Mr.</label>
                    <label style="padding-right: 20px;">
                        <#if isMrs==true>
                        <input type="checkbox" checked="checked">
                        <#else>
                        <input type="checkbox">
                    </#if>
                        Mrs.</label>
                    <label>
                        <#if isMs==true>
                        <input type="checkbox" checked="checked">
                        <#else>
                        <input type="checkbox">
                    </#if>
                        Ms.</label><br/>
                    <label>
                        <#if isOther==true>
                        <input type="checkbox" checked="checked">
                        <#else>
                        <input type="checkbox">
                    </#if>
                        Other:</label>
                </td>
                <td valign="top" style="width: 20%">
                    First Name<br/>
                    ${firstName}
                </td>
                <td valign="top" style="width: 20%">
                    Middle Name<br/>
                    ${middleName}
                </td>
                <td valign="top" style="width: 40%">
                    Last Name<br/>
                    ${lastName}
                </td>
            </tr>


        </table>
        <table style="width: 100%">
            <tr style="height: 36px">
                <td valign="top" style="width: 10%">
                    Apt/Unit<br/>
                    ${section1Apt}
                </td>
                <td valign="top" style="width: 31%">
                    Address<br/>
                    ${section1Address}
                </td>
                <td valign="top" style="width: 20%">
                    City<br/>
                    ${section1City}
                </td>
                <td valign="top" style="width: 10%">
                    Province<br/>
                    ${section1Province}
                </td>
                <td valign="top" style="width: 16%">
                    Postal Code<br/>
                    ${section1PostalCode}
                </td>
            </tr>
        </table>
        <table style="width: 100%">
            <tr style="height: 36px">
                <td valign="top" style="width: 25%">
                    Home Number<br/>
                    ${homeNumber}
                </td>
                <td valign="top" style="width: 20%">
                    Mobile Number<br/>
                    ${mobileNumber}
                </td>
                <td valign="top" style="width: 55%">
                    Email<br/>
                    ${email}
                </td>
            </tr>
        </table>
    </div>
    <div style="position: relative; width: 100%; top: 66px;"><p class="heading" style="float: left"> SECTION 2 -
        DIRECTION</p></div>
    <p style="position: relative; padding-top: 91px"><span>Pursuant to Section 42 of the Ontario <i>Pension Benefits Act</i> (PBA) I am transferring part or all of the commuted value of my pension.</span><br/>
        <span style="position: relative; top: 14px"><b>From: OMERS, EY Tower, 900 -100 Adelaide St W, Toronto, ON M5H 0E2</b></span><br/>
        <span style="position: relative; top: 27px"><b>To:</b> (<i>please check and complete one of the following</i>)</span><br>
    </p>

    <div style="position: relative; width: 100%; padding-top: 39px;">
        <span><label><#if isRegPensionPlan==true>
            <input type="checkbox" checked="checked" class="checkmark">
             <#else>
            <input type="checkbox" class="checkmark">
            </#if>
            <span style="padding-left: 5px"><b>Registered Pension Plan</b></span></label>
        </span>
        <div style="position:relative; padding-top: 11px;">
            <div style="position:relative; padding-bottom: 12px; width: 96%; left: 15px">
                <table style="width: 100%; position: relative">
                    <tr style="height: 36px">
                        <td valign="top">
                            Name of Pension Plan<br/>
                            <#if isRegPensionPlan==true> ${nameOfPensionPlan} <#else></#if>
                        </td>
                    </tr>
                </table>
                <table style="width: 100%; position: relative;">
                    <tr style="height: 36px">
                        <td valign="top" style="width: 50%">
                            Address<br/>
                            <#if isRegPensionPlan==true> ${section2Address1} <#else></#if>
                        </td>
                        <td valign="top" style="width: 20%">
                            City<br/>
                            <#if isRegPensionPlan==true> ${section2City1} <#else></#if>
                        </td>
                        <td valign="top" style="width: 10%">
                            Province<br/>
                            <#if isRegPensionPlan==true> ${section2Province1} <#else></#if>
                        </td>
                        <td valign="top" style="width: 20%">
                            Postal Code<br/>
                            <#if isRegPensionPlan==true> ${section2PostalCode1} <#else></#if>
                        </td>
                    </tr>
                </table>
                <table style="width: 100%; position: relative;">
                    <tr style="height: 36px">
                        <td valign="top" style="width: 22%">
                            Phone<br/>
                            <#if isRegPensionPlan==true> ${section2Phone} <#else></#if>
                        </td>
                        <td valign="top" style="width: 39%">
                            Provincial or Federal registration number (if any)<br/>
                            <#if isRegPensionPlan==true> ${provincialOrFederalRegNumber} <#else></#if>
                        </td>
                        <td valign="top" style="width: 39%">
                            CCRA registration number (if any)<br/>
                            <#if isRegPensionPlan==true> ${ccraRegNumber} <#else></#if>
                        </td>
                    </tr>
                </table>
            </div>
            <span style="position: relative;"><label>
                <#if isRRSPorLIRA==true>
                <input type="checkbox" checked="checked" class="checkmark">
                <#else>
                  <input type="checkbox" class="checkmark">
                </#if>
                <span style="padding: 5px"><b>Locked-in RRSP or LIRA</b>, established under the <i>Income Tax Act</i> of Canada</span></label>
            </span>
            <div style="position: relative;padding-top: 9px; padding-bottom: 9px; left: 15px; width: 96%">
                <table style="width: 100%; position: relative;">
                    <tr style="height: 36px">
                        <td valign="top" style="width: 60%">
                            Name of Financial Institution providing the RRSP or LIRA<br/>
                            <#if isRRSPorLIRA==true> ${nameOfFinancialInstitution} <#else></#if>
                        </td>
                        <td valign="top" style="width: 40%">
                            RRSP or LIRA account number<br/>
                            <#if isRRSPorLIRA==true> ${rrspOrLiraAcoountNumber} <#else></#if>
                        </td>
                    </tr>
                </table>
                <table style="width: 100%; position: relative;">
                    <tr style="height: 36px">
                        <td valign="top" style="width: 50%">
                            Address<br/>
                            <#if isRRSPorLIRA==true> ${section2Address2} <#else></#if>
                        </td>
                        <td valign="top" style="width: 20%">
                            City<br/>
                            <#if isRRSPorLIRA==true> ${section2City2} <#else></#if>
                        </td>
                        <td valign="top" style="width: 10%">
                            Province<br/>
                            <#if isRRSPorLIRA==true> ${section2Province2} <#else></#if>
                        </td>
                        <td valign="top" style="width: 20%">
                            Postal Code<br/>
                            <#if isRRSPorLIRA==true> ${section2PostalCode2} <#else></#if>
                        </td>
                    </tr>
                </table>
            </div>
            <p><label>
                <#if isAnnuity==true>
                <input type="checkbox" checked="checked" class="checkmark">
                <#else>
                <input type="checkbox" class="checkmark">
                </#if>
                <span style="position: relative;"><span style="padding: 5px"><b>Annuity</b> (The insurance company below will purchase a life annuity which conforms with the PBA and the regulation made under the PBA,
                <span style="padding-left: 17px;">payment of which will not occur before the earliest date the member would have been entitled to receive a pension coincident with the benefit
                </span><span style="padding-left: 17px;">transferred from OMERS.)</span></span></span></label>
            </p>
            <div style="position: relative; padding-top: 6px; left: 15px; width: 96%">
                <table style="width: 100%; position: relative;">
                    <tr style="height: 36px">
                        <td valign="top">
                            Name of Insurance Company<br/>
                            <#if isAnnuity==true>${nameOfInsuranceCompany}<#else></#if>
                        </td>
                    </tr>
                </table>
                <table style="width: 100%; position: relative;">
                    <tr style="height: 36px">
                        <td valign="top" style="width: 50%">
                            Address of Branch of the Insurance Company Paying the Annuity<br/>
                            <#if isAnnuity==true> ${section2Address3}<#else></#if>
                        </td>
                        <td valign="top" style="width: 20%">
                            City<br/>
                            <#if isAnnuity==true> ${section2City3}<#else></#if>
                        </td>
                        <td valign="top" style="width: 10%">
                            Province<br/>
                            <#if isAnnuity==true> ${section2Province3}<#else></#if>
                        </td>
                        <td valign="top" style="width: 20%">
                            Postal Code<br/>
                            <#if isAnnuity==true> ${section2PostalCode3} <#else></#if>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div class=div-footer>
        <hr style="position: relative;">
        <div style="position: relative;text-align: center;" class="footer">
            <span style="float: right"><span style="float: right">Page 1 of 2</span><br/>DTA - Nov. 2020</span>
        </div>
    </div>
</div>

<div id="page2-div" style="position:relative;width:100%;height:980px;padding-top: 3px">
    <div style="position: relative; width: 100%; height: 40px"><img
            src="OMERS_PAGE_LOGO_BW"
            style="position: absolute;height: 30pt;top: 0pt;">
        <form style="position: relative; top: 18px; display: inline-block; bottom: 2px; height:40px; width: 35%; border: 1px solid black; float: right">
            <label>Social Insurance Number</label><br/>
            <span>${socialInsuranceNumber}</span></form>

    </div>

    <div><hr style="position: relative; width: 100%"></div>
    <div style="position: relative; width: 100%; height: 31px"><p class="heading" style="float: left">SECTION 3 -
        APPLICANT''S SIGNATURE</p></p></div>
    <p>By signing below, I certify that I am a former member of OMERS and I am entitled to a deferred pension from
        OMERS.</p>
    <div><span style="position: relative; top: 18px">I terminated employment on:</span>
        <form style="position: relative; left: 155px; width: 137px; height: 40px; border: 1px solid black"><label>Termination Date
            (m/d/y)</label><br/><span>${section3TerminationDate}</span></form>
    </div>
    <div style="padding-top: 34px">
        <div style="width: 69%; float: left; height: 42px">
            <hr>
            <br/><span style="position: relative; top: -19px">Applicant''s Signature</span></div>
        <div style="width: 30%; float: right; height: 42px">
            <hr>
            <br/><span style="position: relative; top: -19px">Date(m/d/y)</span></div>
    </div>

    <div style="height: 74px">
        <div style="width: 69%; float: left; height: 42px">
            <hr>
            <br/><span style="position: relative; top: -19px">Signature of Witness</span></div>
        <div style="width: 30%; float: right; height: 42px">
            <hr>
            <br/><span style="position: relative; top: -19px">Date(m/d/y)</span></div>
    </div>
    <div style="position: relative; width: 100%; height: 31px"><p class="heading" style="float: left">SECTION 4 -
        CERTIFICATION OF RECEIVING PLAN</p></p></div>
    <p>To be completed by the financial institution, trustee or administrator <i>before</i> the funds are transferred.</p>
    <div style="position: relative;top: 21px;"><span>I,</span>
    <form style="position: relative; height: 40px; display: inline-block; left: 13px; width: 23%; border: 1px solid black; top: 2px">
        <label>Administrator''s Name</label><br/>
        <span>${section4AdministratorName}</span>
    </form>
        <span style="padding-left: 27px">certify that I am the administrator of</span>
    <form style="position: relative; height: 40px; display: inline-block;  float: right; width: 45%; border: 1px solid black; top: 7px">
        <label>Name of Financial Institution</label><br/>
        <span>${section4NameOfFinancialInstitution}</span>
    </form>
    </div>
   <div style="position: relative;top: 21px;">
        <span>I consent to accept the transfer of the commuted value of the pension of</span>
    <form style="position: relative; height:40px;display: inline-block; top: 7px; width: 30%; border: 1px solid black">
        <label>Applicant''s Name</label><br/>
        <span>${section4applicantName}</span>
    </form>
    <span>from OMERS.</span>
    </div>
    <div style="position: relative;top: 33px"><span>I consent to administer the transferred funds in accordance with the Ontario <i>Pension Benefits Act</i> and the
        regulations under it, as the same may be
        amended from time to time.</span></div>
    <div style="height: 74px">
        <div style="width: 69%; float: left; padding-top: 96px">
            <hr>
            <br/><span style="position: relative; top: -19px">Signature of Administrator</span></div>
        <div style="width: 30%; float: right; padding-top: 96px">
            <hr>
            <br/><span style="position: relative; top: -19px">Date(m/d/y)</span></div>
    </div>
    <div class="div-footer">
        <hr style="position: relative;">
        <div style="position: relative;" class="footer">
            <div style="float: left; width: 60%">
                <span style="float: left;"><b>OMERS</b> EY Tower | 900 - 100 Adelaide St W | Toronto,ON MSH 0E2 | Canada | omers.com</span>
                <br/><span style="float: left;"><b>Member Support  T +1416.369.2444 +1800.387.0813 | F +1416.369.9704 +1877.369.9704</b></span>

            </div>
            <div style="float: right; width: 40%">
                <span style="float: right; position:relative;">Page 2 of 2</span><br/><span style="float: right;">DTA - Nov. 2020</span>
            </div>
            <div>
                <span style="float: left;"><b>Employer Support  T +1416.350.6750 +1833.884.0389 | F +1416.369.9704 +1877.369.9704</b></span>
            </div>


        </div>
    </div>
</div>
</body>
</html>', true, 1, 'dms_template', current_timestamp);




insert into dmstemplate.template_history (audit_id,template_id, process_id, template_name, template_type, approved_by, modified_by,
                                  modified_on, template_fields, template_data, is_active, version, created_by,
                                  created_on)
values ('64dcf651-94d8-425b-b3cd-ac888efc1ecb','6ffd6a5a-198e-11ed-861d-0242ac120014', 'SAD', 'FLV_AdditionalDisclosure4D_NRA65', 'HTML', '', 'dms_template',
        current_timestamp, '[]',
        '<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css">

        @page :first {
            size: 8.50 *11.00in;
            margin: 8mm;
        }

        table, th, td {
            border: 1pt solid;
            border-collapse: collapse;
        }

        td {
			vertical-align: top;
            padding: 0pt 0pt 2pt 4pt;
        }

        th {
			vertical-align: top;
            text-align: center;
        }

        table {
            width: auto;
        }

        tr {
            line-height: 8pt;
        }
		span.cls_001 {
            font-family: Arial, serif;
            font-size: 10.0px;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }
        span.cls_002 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 18.7px;
            color: rgb(0, 0, 0);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }

        span.cls_003 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 14.7px;
            color: rgb(0, 0, 0);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }

        span.cls_004 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 14.7px;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }

		span.cls_005 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 14.7px;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: italic;
            text-decoration: none
        }
		span.cls_006 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 10.0px;
            color: rgb(0, 0, 0);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }
		span.cls_007 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 10.0px;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: normal;
            text-decoration: underline
        }
		span.cls_008 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 10.0px;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: italic;
            text-decoration: none
        }
		span.cls_009 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 10.0px;
            color: rgb(0, 0, 0);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }

		span.cls_010 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 10.0px;
            color: rgb(0, 0, 0);
            font-weight: bold;
            font-style: normal;
            text-decoration: underline
        }
		div.cls_002 {
            position: absolute;
            right: 8pt;
            top: 56.51pt;
        }

		div.cls_003 {
            position: absolute;
            right: 8pt;

        }

		div.cls_004 {
            position: absolute;
            right: 8pt;
            top: 99.28pt
        }



		</style>
</head>
    <body>


	<div>

    <img src="OMERS_PAGE_LOGO_BW" style="
    position: absolute;
    height: 70px;
    padding-left: 5px;
    top: 0px;

">


	<div class="cls_002"><span class="cls_002">Additional Disclosures - Attachment (NRA 65)</span>
    </div>
    <div style="top:71.51pt"  class="cls_003"><span class="cls_003">Explanation of Pension Plan Provisions that Apply to the Former Member</span>
    </div>
    <div style="top:84.80pt" class="cls_003"><span class="cls_003">to Calculate the Family Law Value</span>
    </div>
    <div class="cls_004"><span class="cls_004">Replacement for Page 10/13 of the </span><span
            class="cls_005">Statement of Family Law Value</span></div>

		<div style=" padding-top: 143px; font-family: Arial, Helvetica, sans-serif;font-size: 10.0px;text-align:top">
		<div>
		<table><col style="width:30%;">
        <col style="width:70%">
		<tr><td colspan="2">The defined benefit provisions of the OMERS Primary Pension Plan are more broadly described in the member handbook found at <span class="cls_007">www.omers.com</span></td></tr>
		<tr><td style="text-align:center;padding-top: 6px;padding-bottom: 6px"><span class="cls_006">Plan Provisions</span></td><td style="text-align:center;padding-top: 6px;padding-bottom: 6px"><span class="cls_006">Provide Details (if Applicable)</span>
</td></tr>
		<tr><td>Plan type</td><td>Jointly Sponsored Pension Plan</td></tr>
		<tr><td>Benefit type</td><td>Defined Benefit – Best Average Earnings (BAE): Best 60 consecutive months of contributory earnings</td></tr>

		<tr><td>Pension benefit formula (defined benefit)</td><td><span class="cls_010">Normal Retirement Pension:</span></br>
<span class="cls_008">2% x BAE x pre-1966 service + ((1.325% x lesser of AYMPE and BAE) + (2% x [BAE minus AYMPE]) x credited
service after 1965).</span> If a member reached 35 years of credited service prior to January 1, 2021, their credited
service will be capped at 35 years. Maximum pension credit prescribed under the ITA applies to credited service
after 1991</br>
<span class="cls_008">AYMPE (Final 5) is based average of the annual YMPE for the year of termination and the 4 preceding years.</td></tr>
		<tr><td>Canada Pension Plan/Old Age Security offset formula</td><td><span class="cls_008">Note – The terms integration/offset/bridge are used interchangeably in OMERS communications.</span></td></tr>
		<tr><td>Canada Pension Plan/Old Age Security integration
formula (and average YMPE used in the calculation)</td><td><span class="cls_007">Unreduced</span> Bridge discontinued at age 65 (See ancillary benefits)</td></tr>
		<tr><td>Normal retirement date(NRD)</td><td>NRD – End of the month the member turns age 65 </br>
NRA (Normal retirement age) is attained age 65. </td></tr>
		<tr><td>Early retirement options</td><td>Within 10 years of Normal Retirement Age (55) regardless of service.</br>
<span class="cls_009">Early Retirement Pension:</span> (Normal Retirement Pension plus Bridge [see below]) x Reduction factor</br>
Benefits are unreduced if member has reached either 65 years of age, 30 years of qualifying service or 90 Factor
(age + qualifying service). If the member has not reached the either milestone, then the pension benefit is reduced
by 5% times number of years the member is from the nearest milestone. (<span class="cls_008">Also - see Benefit Calculation Changes
below</span>)</td></tr>
		<tr><td>Termination benefit</td><td>Termination before the member is within 10 years of Normal Retirement Age: Member is entitled to a deferred
pension. Optional pre-1987 refund contributions with interest (C+I).</td></tr>
		<tr><td>Postponed retirement</td><td>Members who remain in employment beyond NRD continue to accrue service until the earlier of November 30 of
the year they turn age 71 or 35 years of credited service is achieved, if achieved prior to January 1, 2021</td></tr>
		<tr><td>Pre-retirement death benefit</td><td>Order of entitlement to survivor benefits sets first in line for benefits, next in line follows the absence or the prior survivor (see Plan Member Handbook for greater detail): </br>
1.<span style="padding-left: 10pt">	Eligible spouse - 66 2/3% (normal retirement pension) plus 10% (normal retirement pension) per eligible </span>
	<span style="padding-left: 18pt">dependent child (max 100% normal retirement pension). Optional refund based on value of member </span>
	<span style="padding-left: 18pt">pension at death (pre-1987 C+I, post-1986 commuted value). </span></br>
2.<span style="padding-left: 10pt">	Eligible children - 66 2/3% normal retirement pension shared among eligible dependent children.</span></br>
3.<span style="padding-left: 10pt">	Living designated beneficiary: Refund based on value of member’s pension at death.</span></br>
4.<span style="padding-left: 10pt">	Estate: Refund based on value of member’s pension at death.</span></td></tr>
		<tr><td>Normal form of pension</td><td>Joint and Survivor 66 2/3% (no optional forms)</td></tr>
		<tr><td>Ancillary benefits (bridging, supplemental, disability,
etc.)</td><td><span class="cls_009">Bridge (see CPP Integration):</span> Formula (see Benefit CalculationChanges below) </br>
0.675% * AYMPE x credited service after 1965 (<span class="cls_007">reduced</span> as part of “Early Retirement Formula”). </br>
If a member reached 35 years of credited service prior to January 1, 2021, their credited service will be capped at
35 years. <span class="cls_008">(Also - see Benefit Calculation Changes below)</span></br>
<span class="cls_009">Disability Pension</span>: Unreduced pension at any age if total and permanently disabled based on credited service.
Integrated at age 65. For pre-2005 disability pensions immediate integration if in receipt of CPP disability pension. </td></tr>
		<tr><td>Age when bridging or supplemental benefits end</td><td>Earlier of age 65 or on death of member.</td></tr>
		<tr><td>Consent benefits</td><td>n/a</td></tr>
		<tr><td>Minimum benefit formula</td><td>n/a</td></tr>
		<tr><td>Plan Member contribution formula</td><td>https://www.omers.com/contributions-and-pa-calculators</td></tr>
		<tr><td>Indexation (pre-retirement) </td><td>Benefits earned on or before December 31, 2022 receive full indexation based on a measure of CPI up to a
maximum increase of 6%. Any excess is carried forward so it can be used in later years when the CPI increase is
less than 6%. </br>
Benefits earned on or after January 1, 2023 are subject to Shared Risk Indexing, meaning that the level of inflation
protection will depend on the OMERS Sponsors Corporation Board’s annual assessment of the financial health of
the OMERS Plan.</br>
(<span class="cls_008">Also - see Benefit Calculation Changes below</span>)</td></tr>
		<tr><td>Indexation (post-retirement)</td><td>Same as Pre-Retirement</td></tr>
		<tr><td>Other relevant provisions – Benefit Calculation
Changes</td><td>If the member is not eligible to retire at the relevant calculation date, the benefit will be calculated in two parts:</br>
	<span style="padding-left: 12pt"> • </span><span style="padding-left: 10pt">	The benefit based on pre-2013 credited service includes pre-retirement indexing and early retirement</span
		<span style="padding-left: 28pt">subsidies (including the bridge benefit).</span></br>
	<span style="padding-left: 12pt"> • </span><span style="padding-left: 10pt">	The benefit based on post-2012 credited service does not include pre-retirement indexing or early </span>
		<span style="padding-left: 28pt">retirement subsidies (i.e. actuarial equivalent reduction from NRD and no bridge benefit).</span></td></tr>






		</table>
		</div>
		<div style="position:fixed;left:7pt;bottom:6pt" class="cls_001"><span class="cls_001">OMERS, EY Tower, 900 - 100 Adelaide St W, Toronto, ON  M5H 0E2</span>
    </div>
    <div style="position:fixed;right:8pt;bottom:-1pt" class="cls_001"><span class="cls_001">Feb. 2022</span>
    </div>
    <div style="position:fixed;left:7pt;bottom:-1pt" class="cls_001"><span class="cls_001">T +1 416.369.2444  +1 800.387.0813</span>
    </div>




		</div>



		</div>











</body>





</html>', true, 1, 'dms_template', current_timestamp);



insert into dmstemplate.template_history (audit_id,template_id, process_id, template_name, template_type, approved_by, modified_by,
                                  modified_on, template_fields, template_data, is_active, version, created_by,
                                  created_on)
values ('812cfd0b-f027-4e59-a805-b74955daaaca','6ffd6a5a-198e-11ed-861d-0242ac120015', 'SAD', 'FLV_Explanation_of_Pension_Plan_Provisions_4E', 'HTML', '', 'dms_template',
        current_timestamp, '[]',
        '<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css">

        @page :first {
            size: 8.50 *11.00in;
            margin: 8mm;
        }

        table, th, td {
            border: 1pt solid;
            border-collapse: collapse;
        }

        td {
            padding: 0pt 0pt 2pt 4pt;
        }

        th {
            text-align: center;
            line-height: 19pt;
        }

        table {
            width: auto;
        }

        tr {
            line-height: 13pt;
        }

        span.cls_003 {
            font-family: Arial, serif;
            font-size: 15.4pt;
            color: rgb(0, 0, 0);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }

        div.cls_003 {
            position: absolute;
            right: 8pt;
            top: 56.51pt;
        }

        span.cls_004 {
            font-family: Arial, serif;
            font-size: 13.2pt;
            color: rgb(0, 0, 0);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }

        div.cls_004 {
            position: absolute;
            right: 8pt;

        }

        span.cls_005 {
            font-family: Arial, serif;
            font-size: 11.4pt;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }

        div.cls_005 {
            position: absolute;
            right: 8pt;
            top: 104.28pt
        }

        span.cls_006 {
            font-family: Arial, serif;
            font-size: 11.4pt;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: italic;
            text-decoration: none
        }


        span.cls_007 {
            font-family: Arial, serif;
            font-size: 8pt;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }

        span.cls_012 {
            font-family: Arial, serif;
            font-size: 7.2pt;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: normal;
            text-decoration: underline
        }


        span.cls_008 {
            font-family: Arial, serif;
            font-size: 8pt;
            color: rgb(0, 0, 0);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }


        span.cls_002 {
            font-family: Arial, serif;
            font-size: 8.2pt;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }


        span.cls_013 {
            font-family: Arial, serif;
            font-size: 9.2pt;
            color: rgb(0, 0, 0);
            font-weight: bold;
            font-style: normal;
            text-decoration: underline
        }


        span.cls_010 {
            font-family: Arial, serif;
            font-size: 7.2pt;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: italic;
            text-decoration: none
        }


        span.cls_011 {
            font-family: Arial, serif;
            font-size: 7.5pt;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: italic;
            text-decoration: none
        }

        span.cls_014 {
            font-family: Arial, serif;
            font-size: 8.2pt;
            color: rgb(0, 0, 0);
            font-weight: normal;
            font-style: normal;
            text-decoration: underline
        }


        span.cls_009 {
            font-family: Arial, serif;
            font-size: 7.2pt;
            color: rgb(0, 0, 0);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }
    </style>
</head>
<body>
<div>
    <img src="OMERS_PAGE_LOGO_BW" style="
    position: absolute;
    height: 50pt;
    padding-left: 10pt;
    top: 0pt;

">
    <div class="cls_003"><span class="cls_003">Additional Disclosures - Attachment</span>
    </div>
    <div style="top:76.51pt"  class="cls_004"><span class="cls_004">Explanation of Pension Plan Provisions that Apply to the Retired Member</span>
    </div>
    <div style="top:89.80pt" class="cls_004"><span class="cls_004">to Calculate the Family Law Value</span>
    </div>
    <div class="cls_005"><span class="cls_005">Replacement for Page 10/13 of the </span><span
            class="cls_006">Statement of Family Law Value</span></div>
    <div style=" padding-top: 115pt; ">
    <table style="margin-bottom: 6pt"><col style="width:37%">
        <col style="width:63%">
    <tr><td colspan="2"><span class="cls_007">The defined benefit provisions of the OMERS Primary Pension Plan are more broadly described in the member handbook found at </span><span
            class="cls_012">www.omers.com</span></td></tr>
   <tr><th valign = "center"> <span
           class="cls_008">Plan Provisions</span></th>
    <th valign = "center"><span class="cls_008">Provide Details (if Applicable)</span>
    </th></tr>
   <tr><td valign="top"><span class="cls_002">Form of Pension Elected by the Member</span>
  </td>
   <td><span class="cls_002">The normal form of the pension is not optional.<br>
       Joint and Survivor 66 2/3%</span>
   </td></tr>
   <tr><td valign = "top"><span class="cls_002">Indexation</span>
   </td><td><span class="cls_002">Benefits earned on or before December 31, 2022 receive full indexation based on a measure of CPI, up to a
maximum increase of 6%. Any excess is carried forward so it can be used in later years when the CPI
increase is less than 6%. Benefits earned on or after January 1, 2023 are subject to Shared Risk Indexing,
meaning that the level of inflation protection will depend on the OMERS Sponsors Corporation Board’s
annual assessment of the financial health of the OMERS Plan.</span>
   </td></tr>


   <tr><td valign = "top"><span class="cls_002">Canada Pension Plan/Old Age Security offset formula</span>
   </td><td></td></tr>
    <tr><td> <span class="cls_002">Canada Pension Plan/Old Age Security integration formula
(and average YMPE used in the calculation)</span></td>

        <td><span class="cls_002">Bridge discontinued at age 65: </span></td></tr>


        <tr>
        <td valign="top">
        <span class="cls_002">Ancillary Benefits</span></td>

    <td>
    <span class="cls_009">Bridge (see Integration) paid from retirement to age 65:<br></span><span
            class="cls_002">Formula: 0.675% * AYMPE x credited service after 1965 (reduced for early retirement). If a member reached
35 years of credited service on their record prior to January 1, 2021, their credited service will be capped at
35 years.</span><br><br><span class="cls_002">(See Benefit Calculation Changes below)</span>
    </td></tr>
<tr><td valign="top"><span class="cls_002">Other relevant provisions</span>
</td><td><span class="cls_009">Benefit Calculation Changes:<br></span><span class="cls_002">If the member was not eligible to retire at the relevant calculation date, the benefit will be calculated in two
parts:<br>
<span style="padding-left: 12pt"> • </span><span style="padding-left: 10pt">The retirement benefit based on pre-2013 credited service includes pre-retirement indexing and
        <span style="padding-left: 28pt"> early retirement subsidies (including the bridge benefit).<br></span></span>
<span style="padding-left: 12pt"> • </span><span style="padding-left: 10pt">The benefit based on post-2012 credited service does not include pre-retirement indexing or
        <span style="padding-left: 28pt">early retirement subsidies:<br></span></span>
<span style="padding-left: 30pt">o <span style="padding-left: 10pt">Actuarial equivalent reduction on lifetime pension and bridge from NRA for early
    <span style="padding-left: 46pt">retirement.<br></span></span>
<span style="padding-left: 30pt">o <span style="padding-left: 10pt">No bridge for NRA 65.<br><br>
    See Member Handbook for greater details.</span></span></span></span>
</td></tr>


    </table>

    </div>





    <div style="position:fixed;left:7pt;bottom:6pt" class="cls_002"><span class="cls_002">OMERS, EY Tower, 900 - 100 Adelaide St W, Toronto, ON  M5H 0E2</span>
    </div>
    <div style="position:fixed;right:8pt;bottom:-1pt" class="cls_002"><span class="cls_002">Feb. 2022</span>
    </div>
    <div style="position:fixed;left:7pt;bottom:-1pt" class="cls_002"><span class="cls_002">T +1 416.369.2444  +1 800.387.0813</span>
    </div>

</div>
</body>
</html>', true, 1, 'dms_template', current_timestamp);






insert into dmstemplate.template_history (audit_id,template_id, process_id, template_name, template_type, approved_by, modified_by,
                                  modified_on, template_fields, template_data, is_active, version, created_by,
                                  created_on)
values ('fc8ef9ca-7871-4bba-8ba2-2ce1e1b6ba58','6ffd6a5a-198e-11ed-861d-0242ac120008', 'SAD', 'Form4ETemplate', 'HTML', '', 'dms_template',
        current_timestamp, '[
      {
         "defaultValue":"",
         "fieldName":"page1MemberLastName",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page1MemberFirstName",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page1MemberInitials",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"isPage1MemberApplicant",
         "fieldType":"BOOLEAN",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page1SpouseLastName",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page1SpouseFirstName",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page1SpouseInitials",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"isPage1SpouseApplicant",
         "fieldType":"BOOLEAN",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"isPage1ProposedFamilyLawValue",
         "fieldType":"BOOLEAN",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page1StartingSpousalRelationDate",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"isPage1MarriageDate",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"isPage1DateCommonLawRelationship",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"isPage1DateChoosenJointly",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"isPage1DateSpecifiedInCourtOrder",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page1FamilyLawValuationDate",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page2Gross1",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page2Gross2",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page2NameOfPensionPlan",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page2RegistrationNumber",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page2NameOfEmployer",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page2PlanAdminstrator",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page2PartBUnitNumber",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page2PartBStreetNumber",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page2PartBStreetName",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page2PartBCity",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page2PartBProvince",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page2PartBCountry",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page2PartBPostalCode",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page2PartBTelephoneNumber",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page2PartBFaxNumber",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page2PartBEmail",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page2PartCLastName",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page2PartCFirstName",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page2PartCInitials",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page2PartCDateOfBirth",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"nameOfInsuranceCompany",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page2PartCPensionPlan",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page2PartCJointAndSurvivorPension",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page2PartCGuaranteedPensionEnd",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"isPage2PartCGuaranteedPeriodNotApplicable",
         "fieldType":"BOOLEAN",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"isPage2PartCContractualIndexation",
         "fieldType":"BOOLEAN",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page3PartDLastName",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page3PartDFirstName",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page3PartDDateOfBirth",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"isPage3MemberSpouseEntitledToPension",
         "fieldType":"BOOLEAN",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page3PartDSurvivorPensionPayble",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"isPage3PartEDivisionOfInstallment",
         "fieldType":"BOOLEAN",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page3RetiredMemberPensionDateOfDeath",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page3PensionInstallPaidToSpouse",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page3MaximumPerInstalmentPaidToSpouse",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page3RetiredMemberNormalRetiremntAge",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page3RetireMemberPensionNormalRetirementAge",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page3MaxPorPensionPaidSpouseNormalRetireAge",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page3PensionFromNormalToDeath",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page3MaxPensionSpouseFromNormalToRetiredMemberDeath",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page3MaxPerInstallPaidToSpouse",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page4PartERetiredMemberNormalRetirementAge",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page4PartERetiredMemberPensionNormalRetirementAge",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page4PartEMaxPortionPensionSpouseNormalRetirementAge",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page4PartERetireMemberPensionFromNormalRetirement",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page4PartEMaxPortionPensionSpouseNormalRetirementAgeto65",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page4PartERetireMemberPansionFrom65ToDeath",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page4PartEMaxPensionSpouseFrom65ToRetiredMemberDeath",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page4PartEMaxPercentagePensionSpouse",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"isPage4PartECombinedOptionPension",
         "fieldType":"BOOLEAN",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page4PartEestimedAmountPaybleToSpouse",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"isPage4RetiredMemberPensionCannotDivide",
         "fieldType":"BOOLEAN",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page4RetiredMemberCannotDivideReason",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page5PartFNameOfPlanAdministrator",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page5PartFSignOfPlanAdminstrator",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page5PartFDate",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page5PartFFirmName",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page5PartFUnitNumber",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page5PartFStreetNumber",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page5PartFStreetName",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page5PartFCity",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page5PartFProvince",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page5PartFCountry",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page5PartFPostalCode",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page5PartFTelephoneNumber",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page5PartFFaxNumber",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page5PartFEmail",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page6NextStepsAdditionInformation",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page7Calculation1CommutedValueRetiredMemberPension",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page7CommutedValueSpouseSurvivorPension",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page7PreliminaryValueRetiredMemberPension",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page7SurplusAssetsPayable",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page7PreliminaryValuePension",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page8CommutedValueOfRetiredMemberPension",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page8CommutedValueOfSpouseSurvivorPension",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page8AccumulatedInterest",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page8InitialPreliminaryValueRetiredMember",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page8SurplusAssestsPayable",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page8PreliminaryvaluePension",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page8Step2PreliminaryValueUnderStep1",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page8Step2TotalCreditedServiceSpousalRelation",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page8Step2TotalCreditedServiceEntirePeriod",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page8Step2familyLawValueFormula",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page9PreliminaryValueAndfamilyLawValueSpouse",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page10RetiredMemberJoinDate",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page10RetiredMemberCommencedPaymentDate",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"isPage10ExplanationPensionPlanApplyRetiredMember",
         "fieldType":"BOOLEAN",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page10DetailsOfPlanProvision",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"isPage11ActuarialAssumptions",
         "fieldType":"BOOLEAN",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page11NonIndexedInterestRate",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"isPage11IndexedRate",
         "fieldType":"BOOLEAN",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page11AssumptionsNonIndexedRate",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"isPage11RateOfPensionEscalation",
         "fieldType":"BOOLEAN",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page11AssumptionsPensionEscalation",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"isPage11MortalityTableUnisex",
         "fieldType":"BOOLEAN",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"isPage11MortalityTableSexdistinct",
         "fieldType":"BOOLEAN",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page11MortalityAssumptions",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"isPage11OtherRelevantAssumptions",
         "fieldType":"BOOLEAN",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page11OtherRelevantAssumptions",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"isPage11ShortenedLifeInformation",
         "fieldType":"BOOLEAN",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page11ShortenedLifeExpentancyApplication",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"isPage12WindUpPlan",
         "fieldType":"BOOLEAN",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page12EffectiveDateOfWindUp",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"isPage12WindUpYes",
         "fieldType":"BOOLEAN",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"isPage12WindUpNo",
         "fieldType":"BOOLEAN",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"isPage12WindUpUnknown",
         "fieldType":"BOOLEAN",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"isPage12PensionPlanGuaranteedFundYes",
         "fieldType":"BOOLEAN",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"isPage12PensionPlanGuaranteedFundNo",
         "fieldType":"BOOLEAN",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"isPage12SurplusApplicationFamilyLawValuationDate",
         "fieldType":"BOOLEAN",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page12SurplusApplicationFamilyLawValuation",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"isPage12PensionPlanAmmendments",
         "fieldType":"BOOLEAN",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page12PensionPlanAmmendentsYear1",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page12PensionPlanAmmendentsYear2",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page12PensionPlanAmmendentsYear3",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"isPage13AdditionaVoluntaryContribution",
         "fieldType":"BOOLEAN",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page13AdditionalVolutaryContribution",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"isPage13ExcessMemberContribution",
         "fieldType":"BOOLEAN",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page13ExcessMemberContribution",
         "fieldType":"STRING",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"isGuaranteedPeriodNotApplicable",
         "fieldType":"BOOLEAN",
         "isRequired":false
      },
      {
         "defaultValue":"",
         "fieldName":"page3PartDInitials",
         "fieldType":"STRING",
         "isRequired":false
      }
   ]',
        '<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html"
      lang="" xml:lang="">
<head>


    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <style type="text/css">

        @page {
            size: letter;
            margin-left: 11mm;
            margin-right: 11mm;
            margin-bottom: 3mm;
        }
        .checkmark {
            top: 0px;
            position: relative;
            transform: scale(1.5);
        }
         .text{
            border: 0;
            outline: 0;
            border-bottom: 1px solid black;
            width: 135px;
        }
        @media print {
            div {
                page-break-inside: avoid;
            }
        }
        body {
            line-height: 16px;
            font-size: 10pt;
            font-family: Arial, Helvetica, sans-serif;
        }

        .footer {
            font-size: 10px;
            font-family: Arial, Helvetica, sans-serif;
            color: #000000;
        }

        input {
            border: none;
        }

        table, td, th {
            border: 1px solid black;
            border-collapse: collapse;
        }

        td {
            height: 29px;
        }

        table {
            border-left-style: hidden;
            border-right-style: hidden;
        }

        p {
            margin: 0;
            padding: 0;
            width: 100%;
        }

        .heading {
            width: 100%;
            background-color: lightgrey;
            padding: 8px;
        }

        label {
           padding: 4px;
        }

        .div-footer {
            position: absolute;
            bottom: 0px;
            width: 100%;
        }

    </style>
</head>
<body>
<div id="page1-div" style="position:relative;width:100%;height:980px;">

    <img src="https://storage.googleapis.com/dms-demo-latest/FSRA.jpg" style="position: absolute; height: 70px">
    <img src="https://storage.googleapis.com/dms-demo-latest/FSRA%20Ontario.jpg" style="left: 180px;position: absolute; height: 53px;">



    <div style="border-left: 1px solid black;padding-left: 17px;float: right; font-size: 19px;position: relative;width: 427px;"><b>Statement of Family Law Value
        <br/>Retired Member with a Defined Benefit Pension </br><br/>Family Law Form FL–4E</b><br/><span style="font-size: 12px;">(Under section 67.2(9) of
        the Pension Benefits Act)</span>
    </div>

    <div style="position: relative; top: 120px">
    <p>This statement provides the imputed
        value under the Pension Benefits Act and Family Law Act, for a Retired Member who was in receipt of a pension on
        or before the family law valuation date (e.g., separation date). It is completed by the
        plan administrator. This statement
        is provided to both the Retired Member and the Retired Member’s spouse, regardless
        of who makes the application.<br/><br/>The
        imputed value (referred to as
        <b>family law value </b>in
        this statement) is the value of the pension that was accrued during
        the spousal relationship. It is
        calculated as of the family law valuation date. The family law value of the Retired Member’s
        pension is used in the calculation
        of the Retired Member’s net family property. The family law value of the survivor
        pension is used in the calculation
        of the Retired Member’s spouse’s net family property. This statement does not entitle
        the Retired Member’s spouse to a
        portion of the pension.<br/><br/>This statement includes details of how the family law values were calculated. If you
        have questions about the
        calculations, contact the plan
        administrator.<br/><br/>Information about the pension valuation and division process can be found in the
        <a href="https://www.fsrao.ca/consumers/pensions/pensions-and-marriage-breakdown-guide-members-and-their-spouses">Pensions
            and Marriage Breakdown – a</a>
        <a href="https://www.fsrao.ca/consumers/pensions/pensions-and-marriage-breakdown-guide-members-and-their-spouses">Guide
            for Members and their Spouses.</a></p><br/>

    <p class="heading"><b>Part A – Family Law Value</b>
    </p>
    <p style="position: relative;top: 14px;"><b>Name of Retired Member<br/></b></p><br/>
    <table style="width: 100%">
        <tbody>
        <tr>
            <td style="width: 482px; height: 36px">Last Name<br><span>${page1MemberLastName}</span></br></td>
            <td style="width: 482px">First Name<br><span>${page1MemberFirstName}</span></br></td>
            <td>Initials<br><span>${page1MemberInitials}</span></br></td>
            <td style="width: 300px">Applicant <label>
                <#if isPage1MemberApplicant==true>
                <input class="checkmark" checked="checked" type="checkbox">
                <#else>
                <input class="checkmark" type="checkbox">
                </#if>
                Yes</label>
                <label>
                    <#if isPage1MemberApplicant==false>
                    <input class="checkmark" checked="checked" type="checkbox">
                    <#else>
                    <input class="checkmark" type="checkbox"></#if>
                    No</label></td>
        </tr>
        </tbody>
    </table>

    <p><b>Name of Retired Member’s
        Spouse<br/></b></p>
    <table style="width: 100%">
        <tbody>
        <tr>
            <td style="width: 482px; height: 36px">Last Name<br><span>${page1SpouseLastName}</span></br></td>
            <td style="width: 482px">First Name<br><span>${page1SpouseFirstName}</span></br></td>
            <td>Initials<br><span>${page1SpouseInitials}</span></br></td>
            <td style="width: 300px">Applicant <label>
                <#if isPage1SpouseApplicant == true>
                <input class="checkmark" checked = checked type="checkbox">
                <#else>
                <input class="checkmark" type="checkbox"></#if>
                Yes</label>
                <label>
                    <#if isPage1SpouseApplicant == false>
                <input class="checkmark" checked="checked" type="checkbox">
                    <#else>
                <input class="checkmark" type="checkbox"></#if>
                No</label></td>
        </tr>
        <tr>
            <td colspan="4" style="height: 36px">
                You and your spouse have proposed
                two valuation dates. The plan administrator will therefore<br/>
                provide two statements. This
                statement sets out ONE of the two proposed family law values.
                <div style="display: inline-block; position: relative; padding-left: 60px ; bottom: 8px"><label>
                    <#if isPage1ProposedFamilyLawValue == true>
                    <input class="checkmark" type="checkbox" checked = checked name="checkbox0">
                    <#else>
                    <input class="checkmark" type="checkbox" name="checkbox0"></#if>
                    Yes</label><label>
                        <#if isPage1ProposedFamilyLawValue == false>
                        <input class="checkmark" type="checkbox" checked="checked" name="checkbox0">
                        <#else>
                        <input class="checkmark" type="checkbox" name="checkbox0"></#if>
                        No</label></div></td>
        </tr>
        </tbody>
    </table>
    </br>
    <p>The starting date of your spousal
        relationship is (yyyy/mm/dd):<span style="position: relative; left: 8px" class = "text">${page1StartingSpousalRelationDate}</span> <br/><br/>
        <span>The starting date is based on:</span><br/>
        <label style="padding-top: 4px;"><#if isPage1MarriageDate == true>
            <input class="checkmark" checked="checked" type="checkbox">
            <#else>
            <input class="checkmark" type="checkbox"></#if>
            your marriage date</label><br/>
        <label style="padding-top: 4px;"><#if isPage1DateCommonLawRelationship == true>
            <input class="checkmark" checked="checked" type="checkbox">
            <#else>
            <input class="checkmark" type="checkbox"></#if>
            the date
            when you and your spouse started living together in a common-law relationship</label><br/>
        <label style="padding-top: 4px;"><#if isPage1DateChoosenJointly == true>
            <input class="checkmark" checked="checked" type="checkbox">
            <#else>
            <input class="checkmark" type="checkbox"></#if>
            the date that was jointly
            chosen by you and your spouse</label><br/>
        <label style="padding-top: 4px;">
            <#if isPage1DateSpecifiedInCourtOrder == true>
            <input class="checkmark" checked="checked" type="checkbox">
            <#else>
             <input class="checkmark" type="checkbox"></#if>
            the date specified in your court order or family arbitration award</label>
        <br/><br/><span style="padding-right: 83px;">Your <b>family law valuation date </b>is
            (yyyy/mm/dd):</span><span class="text">${page1FamilyLawValuationDate}</span></p>
    </div>
    <div class=div-footer>
    <hr style="position: relative;">
        <div style="position: relative;text-align: center;" class="footer">
            <span style="float: left;">PF-135E (2021)</span>
            <span>© Queen''s Printer for Ontario</span>
            <span style="float: right">Page 1 of 13</span>
        </div>
    </div>
    </div>

<div id="page2-div" style="position:relative;width:100%;height:980px; top: 10px">
    <p class="heading"><b>Family Law Value Summary</b></p>
    <p>The <b>family law value</b> of the <b>Retired Member’s pension</b> (which <b>includes</b> bridging/supplemental
        benefit(s) and surplus, if any, but <b>excludes</b> the spouse’s survivor pension) as of the family law
        valuation date is:</p><br/>

    <p><span style="padding-left:4px">$</span><span class="text">${page2Gross1} (GROSS)</span></p><br/>
    <p>The <b>family law value</b> of the <b>spouse’s survivor pension</b> as of the family law valuation date is:</p>
    <br/>
    <p><span style="padding-left:4px">$</span><span class="text">${page2Gross2} (GROSS)</span></p><br/>
    <p style="padding-bottom: 30px;"><b>Note:</b> The gross family law value of the Retired Member’s pension should be included as an asset on the
        Retired Member’s financial statement. The gross family law value of the survivor pension should be included as
        an asset on the Retired Member’s spouse’s financial statement. The future tax liability for the pension and
        survivor pension should be listed as a debt on each spouse’s respective financial statement. Consult a family
        law lawyer or financial advisor for advice on calculating the future tax rate. Neither the plan administrator
        nor FSRA can provide assistance on determining the future tax liability, completing the financial statement or
        calculating net family property.</p>
    <p class="heading"><b>Part B – Pension Plan Information</b></p>
    <table style="width: 100%;border-top-style: hidden; border-right-style: hidden;">
        <tbody>
        <tr style="height: 39px">
            <td style="width: 70%">
                Name of Pension Plan<br/>
                <span>${page2NameOfPensionPlan}</span>
            </td>
            <td style="width: 30%">
                Registration Number<br/>
                <span>${page2RegistrationNumber}</span>
            </td>
        </tr>
        </tbody>
    </table>
    <table style="width: 100%;border-top-style: hidden; border-right-style: hidden;"><tbody>
        <tr style="height: 39px">
            <td style="height: 36px" colspan="4">
                Name of Employer/Union/Professional Association<br/>
                <span>${page2NameOfEmployer}</span>
            </td>
        </tr>
    </tbody>
    </table>
    <table style="width: 100%;border-top-style: hidden; border-right-style: hidden;"><tbody>
        <tr style="height: 39px">
            <td colspan="4">
                Plan Administrator<br/>
                <span>${page2PlanAdminstrator}</span>
            </td>
        </tr>
    </tbody></table>
   <table style="width: 100%;border-top-style: hidden; border-right-style: hidden;"><tbody>
        <tr style="height: 41px">
            <td colspan="4" valign="bottom">
                <b>Plan Administrator’s Contact Information</b>
            </td>
        </tr></tbody></table>
    <table style="width: 100%;border-top-style: hidden; border-right-style: hidden;"><tbody>
        <tr style="height: 41px">
            <td style="width: 20%">
                Unit Number<br/>
                <span>${page2PartBUnitNumber}</span>
            </td>
            <td style="width: 20%">
                Street Number<br/>
                <span>${page2PartBStreetNumber}</span>
            </td>
            <td colspan="2">
                Street Name<br/>
                <span>${page2PartBStreetName}</span>
            </td>
        </tr>
    </tbody></table>
    <table style="width: 100%;border-top-style: hidden; border-right-style: hidden;"><tbody>
        <tr style="height: 41px">
            <td style="width: 25%">
                City<br/>
                <span>${page2PartBCity}</span>
            </td>
            <td style="width: 25%">
                Province/State<br/>
                <span>${page2PartBProvince}</span>
            </td>
            <td style="width: 25%">
                Country<br/>
                <span>${page2PartBCountry}</span>
            </td>
            <td style="width: 25%">
                Postal Code/Zip Code<br/>
                <span>${page2PartBPostalCode}</span>
            </td>
        </tr>
    </tbody></table>
    <table style="width: 100%;border-top-style: hidden; border-right-style: hidden;"><tbody>
        <tr style="height: 41px">
            <td style="width: 20%">
                Telephone Number<br/>
                <span>${page2PartBTelephoneNumber}</span>
            </td>
            <td style="width:20%">
                Fax Number<br/>
                <span>${page2PartBFaxNumber}</span>
            </td>
            <td colspan="2">
                E-mail Address<br/>
                <span>${page2PartBEmail}</span>
            </td>
        </tr>
        </tbody>
    </table>
    <br/><br/>
    <p class="heading"><b>Part C – Information about the Retired Member</b></p>
    <table style="width: 100%; border-top-style: hidden">
        <tr style="height: 41px">
            <td style="width: 45%">
                Last Name<br/>
                <span>${page2PartCLastName}</span>
            </td>
            <td style="width: 45%">
                First Name<br/>
                <span>${page2PartCFirstName}</span>
            </td>
            <td style="width: 10%">
                Initials<br/>
                <span>${page2PartCInitials}</span>
            </td>
        </tr>
    </table>
    <table style="width: 100%; border-top-style: hidden">
        <tr style="height: 41px">
            <td style="width: 35%">
                Date of Birth (yyyy/mm/dd)<br/>
                <span>${page2PartCDateOfBirth}</span>
            </td>
            <td width="65%">
                Employee/Pension Plan Identification Number, if applicable<br/>
                <span>${page2PartCPensionPlan}</span>
            </td>
        </tr>
        <tr style="height: 41px">
            <td colspan="2">
                The Retired Member’s pension is paid in the following form<br/>
                (e.g. joint and survivor % pension):
                <span style = "padding-left: 2px">${page2PartCJointAndSurvivorPension}</span>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                The guaranteed period for the Retired Member’s pension ends on (yyyy/mm):
                <span style="padding-left: 2px"><#if isGuaranteedPeriodNotApplicable == false> ${page2PartCGuaranteedPensionEnd} <#else></#if></span>
                <div style="display: inline-block; padding-left: 15px; position: relative"><label>
                    <#if isPage2PartCGuaranteedPeriodNotApplicable == true>
                    <input class="checkmark" checked= checked type="checkbox">
                    <#else>
                    <input class="checkmark" type="checkbox"></#if>
                    not applicable</label></div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                The Retired Member is entitled to contractual indexation:
                <div style="float: right;padding-right: 150px"><label>
                    <#if isPage2PartCContractualIndexation == true>
                    <input class="checkmark" checked = checked type="checkbox" >
                    <#else>
                    <input class="checkmark" type="checkbox" ></#if>
                    Yes</label>
                <label>
                    <#if isPage2PartCContractualIndexation == false>
                    <input class="checkmark" checked="checked" type="checkbox">
                    <#else>
                    <input class="checkmark" type="checkbox"></#if>
                    No</label></div>
            </td>
        </tr>
    </table>
    <div class="div-footer">
        <hr style="position: relative;">
        <div style="position: relative;text-align: center;" class="footer">
            <span style="float: left;">PF-135E (2021)</span>
            <span>© Queen''s Printer for Ontario</span>
            <span style="float: right">Page 2 of 13</span>
        </div>
    </div>
    </div>


<div id="page3-div" style="position:relative;width:100%;height:980px;">
    <p class="heading"><b>Part D – Information about the Retired Member’s Spouse</b></p>
    <table style="width: 100%; border-top-style: hidden; border-bottom: hidden";>
        <tbody>
        <tr>
            <td style="width: 33%;height: 36px" valign="top">Last Name<br/><span>${page3PartDLastName}</span></td>
            <td style="width: 33%;height: 36px" valign="top">First Name<br/><span>${page3PartDFirstName}</span></td>
            <td>Intials<br/><span>${page3PartDInitials}</span></td>
            <td style="width: 30%">Date of Birth (yyyy/mm/dd)<br/><span>${page3PartDDateOfBirth}</span></td>
        </tr>
        <tr>
            <td colspan="4">The Retired Member’s spouse is entitled to a survivor pension upon the death of the Retired
                Member
                <label>
                    <#if isPage3MemberSpouseEntitledToPension == true>
                    <input class="checkmark" checked="checked" type="checkbox">
                    <#else>
                    <input class="checkmark" type="checkbox"></#if>
                    Yes</label><label>
                    <#if isPage3MemberSpouseEntitledToPension == false>
                    <input class="checkmark" checked = checked type="checkbox">
                    <#else>
                    <input class="checkmark" type="checkbox"></#if>
                    No</label>
            </td>
        </tr>
        <tr>
            <td colspan="4">If yes, the following survivor pension is payable as a percentage (%) of the Retired
                Member’s lifetime pension:<br/><span style="width: 100%; padding: 16px; padding-left: 0px;">${page3PartDSurvivorPensionPayble}</span></td>
        </tr>
        </tbody>
    </table>
    <hr>
    <p class="heading"><b>Part E – Pension Division Options for the Retired Member’s Spouse</b></p>
    <p>If the Retired Member is required to make an equalization payment, up to 50% of each pension instalment (that
        accrued during the spousal relationship as of the family law valuation date) can be assigned to the Retired
        Member’s spouse in a court order, family arbitration award or domestic contract (e.g., separation
        agreement).</p>
    <div style="padding: 12px; padding-right: 25px"><p style="background-color: lightgrey;padding: 10px">Example: A Retired Member’s monthly pension on the family law
        valuation date is <span style="padding-left:4px">$</span>1,000. The parties were married 6 out of the 10 years of plan membership. The pension that
        accrued during the marriage is: <br/>$1,000 X 6/10 =<span style="padding-left:4px">$</span>600. The maximum portion that can be paid to the spouse is 50%
        of $600 = $300. Therefore, the maximum percentage of each pension instalment that can be paid to the spouse is
        <span style="padding-left:4px">$</span>300/$1,000 X100% = 30%.</p></div>
    <p>The following pension division options are available to the Retired Member’s spouse:</p>
    <div style="position: relative; height: 569px; width: 100%; border: 1px solid black;">

        <p><label style="position: relative; top: 3px"><#if isPage3PartEDivisionOfInstallment == true><input class="checkmark" type="checkbox" checked = checked style="left: 3px; top:3px"><#else><input class="checkmark" type="checkbox" style="left: 3px; top:3px"></#if><span style="padding-left: 9px"><b>Division of each instalment of the Retired Member’s pension as at the family law
            valuation date</b> (by</span><span style="padding-left: 22px">completing <b>Spouse’s Application to Divide a Retired Member’s Pension (Family Law Form
            FL–6)</b>).</span></label></p>

        <div style="padding: 25px; padding-top: 12px; line-height: 15px">
        <p>The Retired Member’s pension is payable for the lifetime of the Retired Member and stops on the Retired
            Member’s death. Bridging/supplemental benefits are temporary benefits, which generally stop once the Retired
            Member attains normal retirement age. The Retired Member’s pension reported below (including
            bridging/supplemental benefits, if applicable) reflects amounts calculated as at the family law valuation
            date. You will need to refer to this information if the pension is going to be divided (see the <b>Next
                Steps</b> section of this statement).</p>
        <br/>
        <p><b>i) If the Retired Member is not entitled to bridging/supplemental benefits:</b></p><br/>
            <p>The Retired Member’s monthly pension payable to date of death is: <span style="float: right; padding-right: 11px;"><span style="padding-left:4px">$</span><span class="text">${page3RetiredMemberPensionDateOfDeath}</span></span></p><br/>
            <p>The maximum portion of each pension instalment that may be paid to the spouse is:<span style="float: right; padding-right: 11px;"><span style="padding-left:4px">$</span><span class="text" >${page3PensionInstallPaidToSpouse}</span></span></p>
        <br/>
            <p>The maximum percentage of each pension instalment that may be paid to the spouse is:<span style="float: right"><span style="padding-left:4px"></span><span class="text">${page3MaximumPerInstalmentPaidToSpouse}%</span></span></p>
        <br/>
            <p><b>ii) If the Retired Member is entitled to bridging/supplemental benefits until normal retirement age:</b></p>
            <br/><p>The Retired Member’s normal retirement age is: <span style="float: right; padding-right: 11px;"><span class="text">${page3RetiredMemberNormalRetiremntAge}</span></span></p>
        <br/><p>(a) The Retired Member’s monthly pension payable to the normal<br/>
            <span style="padding-left: 24px">retirement age is:</span><span style="float: right;padding-right: 11px;"><span style="padding-left:4px">$</span><span class="text">${page3RetireMemberPensionNormalRetirementAge}</span></span></p>

            <br/><p><span style="padding-left: 22px">The maximum portion of each pension instalment that may be paid to the<br/></span><span style="padding-left: 22px">spouse to the normal retirement age
            is:</span><span style="float: right; padding-right: 11px;"><span style="padding-left:4px">$</span><span class="text">${page3MaxPorPensionPaidSpouseNormalRetireAge}</span></span></p><br/>
        <p>(b) The Retired Member’s monthly pension payable from the normal retirement<br/>
            <span style="padding-left: 24px">age to date of death is:</span><span style="float: right; padding-right: 11px;"><span style="padding-left:4px">$</span><span class="text">${page3PensionFromNormalToDeath}</span></span></p>
            <br/><p><span style="padding-left: 22px">The maximum portion of each pension instalment that may be paid to the<br/></span>
            <span style="padding-left: 22px">spouse from the normal retirement age
                to the Retired Member’s death is:</span><span style="float: right; padding-right: 11px;"><span style="padding-left:4px">$</span><span class="text">${page3MaxPensionSpouseFromNormalToRetiredMemberDeath}</span></span></p>
            <p><br/><span style="padding-left: 22px">The maximum percentage of each pension instalment that may</span><br/><span style="padding-left: 22px">be paid to the spouse is:</span><span style="float: right"><span class="text" type="text">${page3MaxPerInstallPaidToSpouse}%</span></span></p>
    </div>
</div>
    <div class="div-footer">
        <hr style="position: relative;">
        <div style="position: relative;text-align: center;" class="footer">
            <span style="float: left;">PF-135E (2021)</span>
            <span>© Queen''s Printer for Ontario</span>
            <span style="float: right">Page 3 of 13</span>
        </div>
    </div>
</div>


<div id="page4-div" style="position:relative;width:100%;height:980px;">
    <div style="height: 408px; width: 100%; border: 1px solid black;">
        <div style="padding: 14px">
        <p><b>iii) If the Retired Member is entitled to bridging/supplemental benefits before and after<br/><span style="padding-left: 22px">normal
            retirement age:</span></b></p>
            <p>The Retired Member’s normal retirement age is: <span style="float: right; padding-right: 11px"><span style="padding-left: 4px" class="text">${page4PartERetiredMemberNormalRetirementAge}</span></span></p><br/>
            <p>(a) The Retired Member’s monthly pension payable to the normal retirement<br/><span style="padding-left: 22px">age is:</span><span style="float: right; padding-right: 11px"><span style="padding-left:4px">$</span><span class="text">${page4PartERetiredMemberPensionNormalRetirementAge}</span></span></p>
        <br/><p style="padding-left: 22px;">The maximum portion of each pension instalment that may be paid to the<br/><span style="padding-left: 0px">spouse to the normal retirement age
            is:</span> <span style="float: right; padding-right: 34px"><span style="padding-left:4px">$</span><span class="text">${page4PartEMaxPortionPensionSpouseNormalRetirementAge}</span></span></p>
            <br/><p>(b) The Retired Member’s monthly pension payable from the normal retirement<br/><span style="padding-left: 22px">age to age 65 is: </span><span style="float: right; padding-right: 11px"><span style="padding-left:4px">$</span>
            <span class="text">${page4PartERetireMemberPensionFromNormalRetirement}</span></span></p><br/>
        <p style="padding-left: 22px">The maximum portion of each pension instalment that may be paid to the<br/>
            <span style="padding-left: 0px">spouse from the normal retirement age
                to age 65 is: </span><span style="float: right; padding-right: 34px"><span style="padding-left:4px">$</span><span class="text">${page4PartEMaxPortionPensionSpouseNormalRetirementAgeto65}</span></span></p>
        <br/><p>(c) The Retired Member’s monthly pension payable from age 65 to date of<br/>
            <span style="padding-left: 22px">death is: </span><span style="float: right; padding-right: 11px"><span style="padding-left:4px">$</span><span class="text">${page4PartERetireMemberPansionFrom65ToDeath}</span></span></p>
        <br/>
        <p style="padding-left: 22px;">The maximum portion of each pension instalment that may be paid to the<br/><span style = "padding-left: 0px">spouse from age 65 to the Retired
            Member’s death is: </span><span style="float: right; padding-right: 34px"><span style="padding-left:4px">$</span><span class="text">${page4PartEMaxPensionSpouseFrom65ToRetiredMemberDeath}</span></span></p>
            <br/><p style="padding-left: 22px;">The maximum percentage of each pension instalment that may be paid to the<br/><span style="padding-left: 0px">spouse is:</span> <span style="float: right; padding-right: 23px"><span class="text">${page4PartEMaxPercentagePensionSpouse}%</span></span></p>
    </div>
</div>
    <div style="position: relative; height: 212px; width: 100%; border: 1px solid black;">
        <div style="padding: 14px">
        <p><label><#if isPage4PartECombinedOptionPension == true><input class="checkmark" checked="checked" type="checkbox"><#else><input class="checkmark" type="checkbox"></#if><b>Combined option pension </b> (available only if the pension plan provides this
            option).</label></p><br/>
        <div style="padding-left: 15px">The spouse’s pension is paid independently from the pension payable to the Retired Member. If this option is
            available and selected, the spouse must waive the survivor pension by completing <b>Spouse’s Application to
                Divide a Retired Member’s Pension – Special (Combined Option) (Family Law Form FL–6S).</b> The amount of
            pension payable to the spouse is the amount that can be provided by the spouse’s portion of the family law
            value of the Retired Member’s pension plus the family law value of the survivor pension.<br/><br/>
        The estimated amount of the combined option monthly pension payable to the spouse (assuming that the maximum
            portion of the family law value of the Retired Member’s pension is payable) is:<br/><br/>
            $<#if isPage4PartECombinedOptionPension == true><span class="text">${page4PartEestimedAmountPaybleToSpouse}</span><#else><span class="text"></span></#if> (Note: This amount is an estimate only and is not guaranteed.)</div><br/>
        </div>
    </div>
    <div style="position: relative; height: 178px; width: 100%; border: 1px solid black;">
        <div style="padding: 10px">
        <p><label><#if isPage4RetiredMemberPensionCannotDivide == true><input class="checkmark" checked="checked" type="checkbox">
            <#else><input class="checkmark" type="checkbox"></#if>
            The Retired Member’s pension cannot be divided. This is because: <br/>
            <#if isPage4RetiredMemberPensionCannotDivide == true><span type="text" style="width: 100%; height: 145px">${page4RetiredMemberCannotDivideReason}</span>
            <#else><span type="text" style="width: 100%; height: 145px"></span></#if>
            </label></p>
        </div>
    </div>
    <div class="div-footer">
        <hr style="position: relative;">
        <div style="position: relative;text-align: center;" class="footer">
            <span style="float: left;">PF-135E (2021)</span>
            <span>© Queen''s Printer for Ontario</span>
            <span style="float: right">Page 4 of 13</span>
        </div>
    </div>
</div>


<div id="page5-div" style="position:relative;width:100%;height:980px;">
    <p class="heading"><b>Part F – Certification by the Plan Administrator</b></p><br/>
    <p>I certify that this statement is accurate based on the information provided by the applicant in their <b>Application
        for Family Law Value (Family Law Form FL–1)</b> and the data contained in the pension plan records.</p>
    <br/>
    <table style="width: 100%">
        <tbody>
        <tr style="height: 44px">
            <td colspan="4">
                Name of plan administrator or plan administrator’s authorized agent or representative (printed)<br/>
                <span style="width: 99%">${page5PartFNameOfPlanAdministrator}</span>
            </td>
        </tr>
        <tr style="height: 55px">
            <td valign="top" colspan="3">
                Signature of plan administrator or plan administrator’s authorized agent or representative<br/>
                <span style="width: 99%">${page5PartFSignOfPlanAdminstrator}</span>
            </td>
            <td valign="top">
                Date (yyyy/mm/dd)<br/>
                <span style="width: 99%">${page5PartFDate}</span>
            </td>
        </tr>
        <tr>
            <td valign="bottom" colspan="4">
                <b>Information about the plan administrator’s authorized agent or representative (if applicable)</b>
            </td>
        </tr>
        </tbody></table>
    <table style="width: 100%"><tbody>
        <tr style="height: 44px">
            <td colspan="2">
                Firm/Company Name<br/>
                <span style="width: 99%">${page5PartFFirmName}</span>
            </td>
        </tr></tbody></table>
    <table style="width: 100%"><tbody>
        <tr style="height: 44px">
            <td style="width: 20%">
                Unit Number<br/>
                <span style="width: 98%">${page5PartFUnitNumber}</span>
            </td>
            <td style="width: 20%">
                Street Number<br/>
                <span style="width: 98%">${page5PartFStreetNumber}</span>
            </td>
            <td colspan="2">
                Street Name<br/>
                <span style="width: 98%">${page5PartFStreetName}</span>
            </td>
        </tr>
    </tbody>
    </table>
    <table style="width: 100%"><tbody>
        <tr style="height: 44px">
            <td style="width: 25%">
                City<br/>
                <span style="width: 98%">${page5PartFCity}</span>
            </td>
            <td style="width: 25%">
                Province/State<br/>
                <span>${page5PartFProvince}</span>
            </td>
            <td style="width: 25%">
                Country<br/>
                <span style="width: 98%">${page5PartFCountry}</span>
            </td>
            <td style="width: 25%">
                Postal Code/Zip Code<br/>
                <span style="width: 98%">${page5PartFPostalCode}</span>
            </td>
        </tr></tbody></table>
    <table style="width: 100%"><tbody>
        <tr style="height: 44px">
            <td style="width: 20%">
                Telephone Number<br/>
                <span style="width: 98%">${page5PartFTelephoneNumber}</span>
            </td>
            <td style="width: 20%">
                Fax Number<br/>
                <span style="width: 98%">${page5PartFFaxNumber}</span>
            </td>
            <td colspan="2">
                E-mail Address<br/>
                <span style="width: 98%">${page5PartFEmail}</span>
            </td>
        </tr>
        </tbody>
    </table>
    <div class="div-footer">
        <hr style="position: relative;">
        <div style="position: relative;text-align: center;" class="footer">
            <span style="float: left;">PF-135E (2021)</span>
            <span>© Queen''s Printer for Ontario</span>
            <span style="float: right">Page 5 of 13</span>
        </div>
    </div>
</div>


<div id="page6-div" style="position:relative;width:100%;height:980px;line-height: 17px">
    <p class="heading"><b>Next Steps</b></p><br/>
    <p><b>If Your Decision is Not to Divide the Pension</b></p>
    <p><span>•</span><span style="padding-left: 20px">Consider informing the plan administrator that the pension is not going to be divided.</span></p><br/>
    <p><b>If Your Decision is to Divide the Pension</b></p>
    <p><span>1.</span><span style="padding-left: 20px">Finalize the court order, family arbitration award or domestic contract. This document must:</span><br/>
        <span style="padding-left: 32px;">a.</span><span style="padding-left: 10px;">state the family law valuation date;</span><br/>
        <span style="padding-left: 32px;">b.</span><span style="padding-left: 10px;">include the name of the pension plan (as stated in <b>Part B</b>);</span><br/>
        <span style="padding-left: 32px;">c.</span><span style="padding-left: 10px;">authorize the division of the Retired Member’s pension; and</span><br/>
        <span style="padding-left: 32px;">d.</span><span style="padding-left: 10px;">state the spouse’s portion as either a specified amount ($) or a percentage (%) of each instalment of the
            <span style="padding-left: 50px;">Retired Member’s pension (see <b>Part A</b> for the maximum payable).</span></span>
    </p>
    <p>
        <span>2.</span><span style="padding-left: 20px">The court order, family arbitration award or domestic contract must be a certified copy. A “certified copy”
        is a </span><span style="padding-left: 32px;">copy of the original document that has been certified as being a true copy of the original document.
    </span></p>
    <p>
        <span>3.</span><span style="top: -17px;padding-left: 34px;display: inline-block;position: relative;">The Retired Member’s spouse must complete either the <b>Spouse’s Application to Divide a Retired Member’s </b>
        <b>Pension (Family Law Form FL–6)</b> or <b>Spouse’s Application to Divide a Retired Member’s Pension – Special (Combined
        Option) (Family Law Form FL–6S)</b>, as applicable. This form, together with the final court order, family
        arbitration award or domestic contract must be sent to the plan administrator.</span>
    </p>
    <p>
        <span style="position:relative;top: -13px">4.</span><div style="padding-left: 34px;position: relative;top: -30px;">See the
        <a href="https://www.fsrao.ca/consumers/how-fsra-protects-consumers/pensions/pensions-and-marriage-breakdown-guide-members-and-their-spouses">
            Pensions and Marriage Breakdown – a Guide for Members and their Spouses</a>
        for additional considerations (e.g., treatment of: arrears, indexation, death of spouse, etc.).</div>
    </p>
    <p>
        <span style="position:relative;top: -27px">5.</span><span style="padding-left: 20px; position:relative; top: -27px">The following is additional information from the plan administrator:</span><br/>
        <span style="width: 99%; height: 440px; display: inline-block">${page6NextStepsAdditionInformation}</span>
    </p>
    <hr>
    <p>
        <b>IMPORTANT:</b> If the Retired Member’s pension ceased to be available under the pension plan before the
        Retired Member’s spouse submits the <b>Family Law Form FL–6</b> or <b>FL–6S</b>, the plan administrator is not required
        to divide the pension.
    </p>
    <div class="div-footer">
        <hr style="position: relative;">
        <div style="position: relative;text-align: center;" class="footer">
            <span style="float: left;">PF-135E (2021)</span>
            <span>© Queen''s Printer for Ontario</span>
            <span style="float: right">Page 6 of 13</span>
        </div>
    </div>
</div>

<div id="page7-div" style="position:relative;width:100%;height:980px;">

    <div style="border-left: 1px solid black; float: right; position:relative; font-size: 19px; padding-left: 17px; width: 415px"><b>Worksheet – Calculation of
        Preliminary Value <br/>and Family Law Value</b></div>
    <br/>
    <div style="position: relative; top: 80px">
    <p>The Worksheet and Additional Disclosure sections provide details and data on the calculations for independent
        verification. Any calculations that are not applicable will be left blank by the plan administrator. The
        following information is provided on the Worksheet:</p><br/>
    <p>Part 1 – Retired Member Information</p><br/>
        <p style="padding-left: 13px"><span>•</span><span style="padding-left: 10px">Step 1 is the calculation of the preliminary value of the Retired Member’s pension;</span></p><br/>
        <p style="padding-left: 13px"><span>•</span><span style="padding-left: 10px">Step 2 is the calculation of the family law value of the Retired Member’s pension; and</span></p><br/>
    <p>Part 2 - Retired Member’s Spouse Information</p></br>
        <p style="padding-left: 13px"><span>•</span><span style="padding-left: 10px">Calculation of the preliminary value and family law value of the spouse’s survivor pension</span></p><br/>
    <hr>
    <p style="text-align: center; padding: 4px; font-size: 17px"><b>Part 1 – Retired Member Information</b></p>
    <hr>
    <p class="heading"><b>Step 1 – Calculation of Preliminary Value</b></p><br/>
    <p><b>NOTE:</b> The <b>preliminary value</b> is the total value of the pension accrued by the Retired Member as of
        the family law valuation date. It has not been adjusted to reflect the period of the spousal relationship.
        Calculation 1 or 2 has been completed, as applicable.</p>
    <br/>
    <table style="border-left: #303030; border-right: #303030; width: 99%">
        <tbody>
        <tr style="background-color: lightgrey">
            <td colspan="3"><b>Calculation 1 - Information about the Preliminary Value of the Retired Member’s
                Pension</b></td>
        </tr>
        <tr style="height: 56px">
            <td style="width: 60%">
                Commuted value of the Retired Member’s pension (including any survivor pension and bridging/supplemental
                benefit(s)) as of the family law valuation date
            </td>
            <td style="width: 20%">
                <span style="padding-left:4px">$</span><span>${page7Calculation1CommutedValueRetiredMemberPension}</span>
            </td>
            <td style="width: 20%">
                <b style="padding-left: 3px">=X</b>
            </td>
        </tr>
        <tr style="height: 56px">
            <td>
                Less: Commuted value of any spouse’s survivor pension (including any survivor pension related to the
                bridging/supplemental benefit(s)) as of the family law valuation date
            </td>
            <td>
                <span style="padding-left:4px">$</span><span>${page7CommutedValueSpouseSurvivorPension}</span>
            </td>
            <td>
                <b style="padding-left: 3px">=Y</b>
            </td>
        </tr>
        <tr style="height: 56px">
            <td>
                Initial preliminary value of the Retired Member’s pension is <b>(X – Y)</b>:
            </td>
            <td>
                <span style="padding-left:4px">$</span><span>${page7PreliminaryValueRetiredMemberPension}</span>
            </td>
            <td>
                <b style="padding-left: 3px">=G</b>
            </td>
        </tr>
        <tr style="height: 56px">
            <td>
                Plus, surplus assets payable, if applicable (0 if not applicable or unknown)
            </td>
            <td>
                <span style="padding-left:4px">$</span><span>${page7SurplusAssetsPayable}</span>
            </td>
            <td>
                <b style="padding-left: 3px">= surplus</b>
            </td>
        </tr>
        <tr style="height: 56px">
            <td>
                <b>Preliminary value of the pension</b>
            </td>
            <td>
                <span style="padding-left:4px">$</span><span>${page7PreliminaryValuePension}</span>
            </td>
            <td>
                <b style="padding-left: 3px">= G + surplus</b>
            </td>
        </tr>
        </tbody>
    </table>
    </div>

    <div class="div-footer">
        <hr style="position: relative;">
        <div style="position: relative;text-align: center;" class="footer">
            <span style="float: left;">PF-135E (2021)</span>
            <span>© Queen''s Printer for Ontario</span>
            <span style="float: right">Page 7 of 13</span>
        </div>
    </div>

</div>

<div id="page8-div" style="position:relative;width:100%;height:980px;">
    <table style="border-left: #303030; border-right: #303030; width: 99%">
        <tbody>
        <tr class="heading">
            <td colspan="3">
                <b>
                    Calculation 2 - Information about the Retired Member’s Preliminary Value (Affected by Wind Up)
                </b>
            </td>
        </tr>
        <tr style="height: 56px">
            <td colspan="3">
                The pension plan has been wound up and the effective date of the wind up occurred <b>on or before</b>
                your family law valuation date. If the effective date of the wind up occurred <b>after</b> your family
                law valuation date, <b>Calculation 1</b> applies instead.
            </td>
        </tr>
        <tr style="height: 56px">
            <td style="width: 60%">
                Commuted value of the Retired Member’s pension (including any survivor pension and bridging/supplemental
                benefit(s)) as of the wind up date
            </td>
            <td style="width: 20%">
                <span style="padding-left:4px">$</span><span>${page8CommutedValueOfRetiredMemberPension}</span>
            </td>
            <td style="width: 20%">
                <b style="padding-left: 3px">= X</b>
            </td>
        </tr>
        <tr style="height: 56px">
            <td>
                Less: Commuted value of any spouse’s survivor pension (including any survivor pension related to the
                bridging/supplemental benefit(s)) as of the wind up date
            </td>
            <td style="width: 20%">
                <span style="padding-left:4px">$</span><span>${page8CommutedValueOfSpouseSurvivorPension}</span>
            </td>
            <td>
                <b style="padding-left: 3px">= Y</b>
            </td>
        </tr>
        <tr style="height: 56px">
            <td>
                Plus: Accumulated interest on <b>(X – Y)</b> from the wind up date to the family law valuation date
            </td>
            <td>
                <span style="padding-left:4px">$</span><span>${page8AccumulatedInterest}</span>
            </td>
            <td>
                <b style="padding-left: 3px">= Z</b>
            </td>
        </tr>
        <tr style="height: 56px">
            <td>
                Initial preliminary value of the Retired Member’s pension is <b>(X – Y + Z)</b>
            </td>
            <td>
                <span style="padding-left:4px">$</span><span>${page8InitialPreliminaryValueRetiredMember}</span>
            </td>
            <td>
                <b style="padding-left: 3px">= G</b>
            </td>
        </tr>
        <tr style="height: 56px">
            <td>Plus, surplus assets payable, if applicable (0 if not applicable or unknown)</td>
            <td>
                <span style="padding-left:4px">$</span><span>${page8SurplusAssestsPayable}</span>
            </td>
            <td><b style="padding-left: 3px">= surplus</b></td>
        </tr>
        <tr style="height: 56px">
            <td>
                <b>Preliminary value of the pension</b>
            </td>
            <td>
                <span style="padding-left:4px">$</span><span>${page8PreliminaryvaluePension}</span>
            </td>
            <td>
                <b style="padding-left: 3px">= G + surplus</b>
            </td>
        </tr>
        </tbody>
    </table>
    <br/>
    <p class="heading"><b>Step 2 – Calculation of Family Law Value (Retired Member)</b></p><br/>
    <p><b>NOTE:</b> The <b>family law value in Part 1 – Retired Member Information</b> is the portion of the <b>preliminary
        value</b> that relates to the period of the spousal relationship (married or common-law) as of the family law
        valuation date.</p>
    <br/>
    <table style="border-left: #303030; border-right: #303030; width: 99%">
        <tbody>
        <tr>
            <td style="background-color: lightgrey" colspan="3">
                <b>Family law value of the Retired Member’s pension</b>
            </td>
        </tr>
        <tr style="height: 56px">
            <td style="width: 60%">
                The preliminary value calculated under <b>Step 1</b> above
            </td>
            <td style="width: 20%">
                <span style="padding-left:4px">$</span><span>${page8Step2PreliminaryValueUnderStep1}</span>
            </td>
            <td style="width: 20%">
                <b style="padding-left: 3px">= (G + surplus)</b>
            </td>
        </tr>
        <tr style="height: 56px">
            <td>
                Total credited service accrued by the Retired Member during the spousal relationship period (beginning
                on the starting date of the spousal relationship and ending on the family law valuation date)
            </td>
            <td>
                <span>${page8Step2TotalCreditedServiceSpousalRelation}</span>
            </td>
            <td>
                <b style="padding-left: 3px">= H</b>
            </td>
        </tr>
        <tr style="height: 56px">
            <td>
                Total credited service accrued by the Retired Member during the entire period of employment or plan
                membership as of the family law valuation date
            </td>
            <td>
                <span>${page8Step2TotalCreditedServiceEntirePeriod}</span>
            </td>
            <td>
                <b style="padding-left: 3px">= J</b>
            </td>
        </tr>
        <tr style="height: 56px">
            <td>
                Family law value formula = <b>(G + surplus) x H/J</b><br/>(Note: H/J cannot exceed 1.)
            </td>
            <td width="182px">
                <span style="padding-left:4px">$</span><span>${page8Step2familyLawValueFormula}</span>
            </td>
            <td>
                <b style="padding-left: 3px">
                    = family law value (pension)
                </b>
            </td>
        </tr>
        </tbody>
    </table>
    <div class="div-footer">
        <hr style="position: relative;">
        <div style="position: relative;text-align: center;" class="footer">
            <span style="float: left;">PF-135E (2021)</span>
            <span>© Queen''s Printer for Ontario</span>
            <span style="float: right">Page 8 of 13</span>
        </div>
    </div>

</div>

<div id="page9-div" style="position:relative;width:100%;height:980px;">
    <hr>
    <p style="text-align: center; font-size: 17px"><b>Part 2 – Retired Member’s Spouse Information</b></p>
    <hr>
    <table style="border-left: #303030; border-right: #303030; width: 99%">
        <tbody>
        <tr>
            <td colspan="3" class="heading">
                <b>Preliminary Value and Family Law Value of the Spouse’s Survivor Pension</b>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <b>NOTE:</b> The <b>preliminary value</b> is the commuted value of the survivor pension that is payable
                to the spouse upon the death of the Retired Member as of the family law valuation date. The <b>family
                law value</b> of the survivor pension is equal to the preliminary value. The survivor pension cannot be
                divided. The survivor pension is payable upon the death of the Retired Member.
            </td>
        </tr>
        <tr style="height: 56px">
            <td>
                The preliminary value and family law value of the spouse’s <b>survivor<br/>pension</b> is:
            </td>
            <td style="width: 26%">
                <span style="padding-left:4px">$</span><span>${page9PreliminaryValueAndfamilyLawValueSpouse}</span>
            </td>
            <td>
                (0 if not applicable)
            </td>
        </tr>
        </tbody>
    </table>
    <div class="div-footer">
        <hr style="position: relative;">
        <div style="position: relative;text-align: center;" class="footer">
            <span style="float: left;">PF-135E (2021)</span>
            <span>© Queen''s Printer for Ontario</span>
            <span style="float: right">Page 9 of 13</span>
        </div>
    </div>

</div>

<div id="page10-div" style="position:relative;width:100%;height:980px;">
    <div style="border-left: 1px solid black; float: right; position:relative; font-size: 19px; padding-left: 17px;"><b>Additional Disclosures</b></div>
    <div style="position: relative; top: 70px">
    <p><b>Plan Membership and Employment Information as of the Family Law Valuation Date</b></p>
    <table style="border:black; width: 100%">
        <tbody>
        <tr style="height: 42px">
            <td>
                The Retired Member joined the pension plan on (yyyy/mm/dd): <span>${page10RetiredMemberJoinDate}</span>
            </td>
        </tr>
        <tr style="height: 42px">
            <td>
                The Retired Member commenced payment of the pension as of (yyyy/mm/dd): <span>${page10RetiredMemberCommencedPaymentDate}</span>
            </td>
        </tr>
        </tbody>
    </table>
    <br/><br/>
    <p><b>Explanation of Pension Plan Provisions that Apply to the Retired Member to Calculate the Family Law Value</b>
    </p>
        <p style="padding: 3px"><label>
            <#if isPage10ExplanationPensionPlanApplyRetiredMember == true>
            <input class="checkmark" checked="checked" type="checkbox">
            <#else>
            <input class="checkmark" type="checkbox"></#if>
            Plan provisions are explained in a separate document that is included with this statement.</label>
    </p>
    <div style="position: relative; width: 100%; height: 600px; border: 1px solid black">
        <p style="padding: 2px">
            The following are details of the plan provisions (for example: pension form elected by the Retired Member,
            post-retirement indexation, ancillary benefit(s), etc.):
        </p><br/>
        <#if isPage10ExplanationPensionPlanApplyRetiredMember == true><span style="width: 99%;height: 540px; display: inline-block">${page10DetailsOfPlanProvision}</span>
        <#else><span style="width: 99%;height: 540px; display: inline-block"></span></#if>
    </div>
    </div>

    <div class="div-footer">
        <hr style="position: relative;">
        <div style="position: relative;text-align: center;" class="footer">
            <span style="float: left;">PF-135E (2021)</span>
            <span>© Queen''s Printer for Ontario</span>
            <span style="float: right">Page 10 of 13</span>
        </div>
    </div>
</div>

<div id="page11-div" style="position:relative;width:100%;height:980px;">
    <p><b>Actuarial Assumptions Used in the Calculation of the Preliminary Value</b></p>
    <p><label>
        <#if isPage11ActuarialAssumptions == true>
        <input class="checkmark" checked="checked" type="checkbox">
        <#else>
        <input class="checkmark" type="checkbox">
        </#if>
        Actuarial assumptions are provided in a separate document that is included with this
        statement.</label></p>
    <table style="border: black; width: 100%;">
        <tbody>
        <th class="heading" style="width: 55%; text-align: center">
            <b>Assumptions based on section 3500 of the Canadian<br/>Institute of Actuaries Standards of Practice</b>
        </th>
        <th  class="heading" style="text-align: center">
            <b>Assumptions</b>

        </th>
        <tr style="height: 67px">
            <td>
                Non-indexed interest rate(s)
            </td>
            <td>
                <#if isPage11ActuarialAssumptions == true><span>${page11NonIndexedInterestRate}</span>
                <#else><span></span></#if>
            </td>
        </tr>
        <tr style="height: 67px">
            <td valign="top">
                Indexed interest rate(s)<br/><br/><label>
                <#if isPage11ActuarialAssumptions == true && isPage11IndexedRate == true>
                <input class="checkmark" checked="checked" type="checkbox">
                <#else>
                <input class="checkmark" type="checkbox"></#if>
                not applicable
            </label></td>
            <td>
                <#if isPage11ActuarialAssumptions == true && isPage11IndexedRate == false><span>${page11AssumptionsNonIndexedRate}</span>
                <#else><span></span></#if>
            </td>
        </tr>
        <tr style="height: 67px">
            <td valign="top">
                Rate(s) of pension escalation<br/><br/><label>
                <#if isPage11ActuarialAssumptions == true && isPage11RateOfPensionEscalation == true>
                <input class="checkmark" checked="checked" type="checkbox">
                <#else>
                <input class="checkmark" type="checkbox"></#if>
                not applicable</label>
            </td>
            <td>
                <#if isPage11ActuarialAssumptions == true && isPage11RateOfPensionEscalation == false><span>${page11AssumptionsPensionEscalation}</span>
                <#else><span></span></#if>
            </td>
        </tr>
        <tr style="height: 67px">
            <td valign="top">
                Mortality table:<br/><br/><label>
                <#if  isPage11ActuarialAssumptions == true && isPage11MortalityTableUnisex == true>
                <input class="checkmark" checked="checked" type="checkbox">
                <#else>
                <input class="checkmark" type="checkbox"></#if>
                unisex (specify % male and % female) and/or</label><br/><br/>
                <label>
                    <#if  isPage11ActuarialAssumptions == true && isPage11MortalityTableSexdistinct == true>
                    <input class="checkmark" checked="checked" type="checkbox">
                    <#else>
                    <input class="checkmark" type="checkbox"></#if>
                    sex-distinct (pre-87 service only)</label>
            </td>
            <td>
                <#if isPage11MortalityTableUnisex == true || isPage11MortalityTableSexdistinct == true && isPage11ActuarialAssumptions == true>
                <span>${page11MortalityAssumptions}</span>
                <#else>
                <span></span></#if>
            </td>
        </tr>
        <tr style="height: 67px">
            <td valign="top">
                Other relevant assumptions<br/><br/><label>
                <#if isPage11ActuarialAssumptions == true && isPage11OtherRelevantAssumptions == true>
                <input class="checkmark" checked="checked" type="checkbox">
                <#else>
                <input class="checkmark" type="checkbox"></#if>
                not applicable</label>
            </td>
            <td>
                <#if isPage11ActuarialAssumptions == true && isPage11OtherRelevantAssumptions == false>
                <span>${page11OtherRelevantAssumptions}</span>
                <#else>
                <span></span></#if>
            </td>
        </tr>
        </tbody>
    </table>
    <br/>
    <p><b>Shortened Life Expectancy Information</b></p>
    <p style="padding: 4px"><label>
        <#if isPage11ShortenedLifeInformation == true>
        <input class="checkmark" checked="checked" type="checkbox">
        <#else>
        <input class="checkmark" type="checkbox"></#if>
        not applicable</label></p>
    <table style="border:black; width: 100%">
        <tbody>
        <tr>
            <td>
                The Retired Member has filed a shortened life expectancy application and the conditions that are
                specified under section 12 or 13 of Ontario Regulation 287/11 (Family Law Matters) apply. The following
                are the actuarial assumptions used in the calculation of the shortened life expectancy family law value:
            </td>
        </tr>
        <tr>
            <td>
                <#if isPage11ShortenedLifeInformation == false>
                <span style="width: 700px;height: 200px; display: inline-block">${page11ShortenedLifeExpentancyApplication}</span>
                <#else>
                <span style="width: 700px;height: 200px; display: inline-block"></span></#if>
            </td>
        </tr>
        </tbody>
    </table>
    <div class="div-footer">
        <hr style="position: relative;">
        <div style="position: relative;text-align: center;" class="footer">
            <span style="float: left;">PF-135E (2021)</span>
            <span>© Queen''s Printer for Ontario</span>
            <span style="float: right">Page 11 of 13</span>
        </div>
    </div>

</div>

<div id="page12-div" style="position:relative;width:100%;height:980px;">
    <p><b>Information about the wind up of the pension plan</b></p>
    <p style="padding: 4px"><label>
        <#if isPage12WindUpPlan == true>
        <input class="checkmark" checked="checked" type="checkbox">
        <#else>
        <input class="checkmark" type="checkbox"></#if>
        not applicable</label></p>
    <table style="border: #303030; width: 100%">
        <tr style="height: 44px">
            <td>
                The following information is provided because the Retired Member is included in the wind up group. The
                effective date of the wind up is <b>on or before</b> the date of this statement.
            </td>
        </tr>
        <tr style="height: 44px">
            <td>
                Effective date of the wind up of the pension plan is (yyyy/mm/dd):
                <#if isPage12WindUpPlan == false><span>${page12EffectiveDateOfWindUp}</span>
                <#else><span></span></#if>
            </td>
        </tr>
        <tr style="height: 44px">
            <td>
                The Retired Member’s pension will be reduced as a result of the wind up
                <div style="float: right; padding-right: 100px"><label>
                    <#if isPage12WindUpPlan == false && isPage12WindUpYes == true>
                    <input class="checkmark" checked="checked" type="checkbox">
                    <#else>
                    <input class="checkmark" type="checkbox"></#if>
                    yes</label>
                <label>
                    <#if isPage12WindUpPlan == false && isPage12WindUpNo == true>
                    <input class="checkmark" checked="checked" type="checkbox">
                    <#else>
                    <input class="checkmark" type="checkbox"></#if>
                    no</label>
                    <label>
                        <#if isPage12WindUpPlan == false && isPage12WindUpUnknown == true>
                        <input class="checkmark" checked="checked" type="checkbox">
                        <#else>
                        <input class="checkmark" type="checkbox"></#if>
                        unknown</label></div>
            </td>
        </tr>
        <tr style="height: 44px">
            <td>
                The pension plan is covered by the Pension Benefits Guarantee Fund
                <div style="float: right; padding-right: 178px"><label>
                    <#if isPage12WindUpPlan == false && isPage12PensionPlanGuaranteedFundYes == true>
                    <input class="checkmark" checked="checked" type="checkbox">
                    <#else>
                    <input class="checkmark" type="checkbox"></#if>
                    yes</label>
                <label>
                    <#if isPage12WindUpPlan == false && isPage12PensionPlanGuaranteedFundNo == true>
                    <input class="checkmark" checked="checked" type="checkbox">
                    <#else>
                    <input class="checkmark" type="checkbox"></#if>
                    no</label></div>
            </td>
        </tr>
    </table>
    <br/>
    <p><b>Information about surplus application made on or before the family law valuation date</b></p><p style="padding: 4px">
    <label>
        <#if isPage12SurplusApplicationFamilyLawValuationDate == true>
        <input class="checkmark" checked="checked" type="checkbox">
        <#else>
        <input class="checkmark" type="checkbox"></#if>
        not applicable</label></p>
    <table style="border: #303030; width: 100%">
        <tr>
            <td>
                The Retired Member is entitled to receive a share of surplus from the pension plan, which is not
                included in family law value. The following is a summary of the relevant details of the surplus
                application (e.g., information about the surplus sharing agreement, etc.):
            </td>
        </tr>
        <tr>
            <td>
                <#if isPage12SurplusApplicationFamilyLawValuationDate == false><span style="width:700px; height: 200px; display: inline-block">${page12SurplusApplicationFamilyLawValuation}</span>
                <#else><span style="width:700px; height: 200px; display: inline-block"></span></#if>
            </td>
        </tr>
    </table><br/>
    <p><b>Information about pension plan amendments before the family law valuation date</b></p><p style="padding: 4px"><label>
    <#if isPage12PensionPlanAmmendments == true>
    <input class="checkmark" checked = "checked" type="checkbox">
    <#else>
    <input class="checkmark" type="checkbox"></#if>
    not
    applicable</label></p>
    <table style="border: #303030">
        <tbody>
        <tr>
            <td>
                The Retired Member belongs to a class of employees that received (or will be receiving) payment(s)
                resulting from amendment(s) to the pension plan related to cost of living adjustments during the last
                three fiscal years of the pension plan before the family law valuation date. The following is an
                explanation of the amendment(s) [e.g., date when the amendment was made, how much the Retired Member
                received (or will receive), etc.].
            </td>
        </tr>
        <tr style="height: 95px">
            <td style="padding: 15px">
                <label><b>Year 1</b></label>
                <#if isPage12PensionPlanAmmendments == false>
                <span type="text" style="float: right;width: 70%;">${page12PensionPlanAmmendentsYear1}</span>
                <#else><span style="float: right;width: 70%;"></span></#if>
            </td>
        </tr>
        <tr style="height: 95px">
            <td style="padding: 15px">
                <label><b>Year 2</b></label>
                <#if isPage12PensionPlanAmmendments == false>
                <span style="float: right;width: 70%;">${page12PensionPlanAmmendentsYear2}</span>
                <#else><span style="float: right;width: 70%;"></span></#if>
            </td>
        </tr>
        <tr style="height: 95px">
            <td style="padding: 15px">
                <label><b>Year 3</b></label>
                <#if isPage12PensionPlanAmmendments == false>
                <span style="float: right;width: 70%;">${page12PensionPlanAmmendentsYear3}</span>
                <#else><span style="float: right;width: 70%;"></span></#if>
            </td>
        </tr>
        </tbody>
    </table>
    <div class="div-footer">
        <hr style="position: relative;">
        <div style="position: relative;text-align: center;" class="footer">
            <span style="float: left;">PF-135E (2021)</span>
            <span>© Queen''s Printer for Ontario</span>
            <span style="float: right">Page 12 of 13</span>
        </div>
    </div>

</div>

<div id="page13-div" style="position:relative;width:100%;height:980px;">
    <p><b>Information about additional voluntary contributions (AVCs) as of the family law valuation date</b></p><p style="padding:4px">
    <label>
        <#if isPage13AdditionaVoluntaryContribution ==true>
        <input class="checkmark" checked="checked" type="checkbox">
        <#else>
        <input class="checkmark" type="checkbox"></#if>
        not applicable </label></p>
    <table style="border: black">
        <tbody>
        <tr style="height: 58px">
            <td colspan="2">
                AVCs are voluntary contributions that a pension plan member may make beyond those that are required to
                be made under the pension plan. The terms of the pension plan specify whether AVCs are allowed and how
                they are to be paid out. The Retired Member’s AVCs, if any, are <b>not included</b> in the family law
                value set out in <b>Part A</b> of this statement.
            </td>
        </tr>
        <tr style=" height: 42px">
            <td>
                The total AVCs as of the family law valuation date, including interest/investment earnings,<br/>remaining in
                the pension plan is:
            </td>
            <td style="width: 20%">
                <span style="padding-left:4px">$</span>
                <#if isPage13AdditionaVoluntaryContribution == false>
                <span>${page13AdditionalVolutaryContribution}</span>
                <#else>
                <span></span></#if>
            </td>
        </tr>

        </tbody>
    </table>
    <br/>
    <p><b>Information about excess member contributions as of the family law valuation date</b></p><p style="padding: 4px"><label>
    <#if isPage13ExcessMemberContribution == true>
    <input class="checkmark" checked="checked" type="checkbox">
    <#else>
    <input class="checkmark" type="checkbox"></#if>
    not applicable</label></p>
    <table style="border: black">
        <tr style="height: 58px">
            <td colspan="2">
                Excess member contributions arise in cases where a pension plan member''s required contributions to the
                pension plan made on or after January 1, 1987 (or an earlier date specified in the pension plan),and
                interest/investment earnings on those contributions, exceed 50% of the commuted value of the pension
                earned after that date. The Retired Member’s excess member contributions, if any, are <b>not
                included</b> in the family law value set out in <b>Part A</b> of this statement.
            </td>
        </tr>
        <tr style="height: 42px">
            <td>
                The total excess member contributions, including interest/investment earnings, remaining in the pension
                plan is:
            </td>
            <td style="width: 20%">
                <span style="padding-left:4px">$</span>
                <#if isPage13ExcessMemberContribution == false><span>${page13ExcessMemberContribution}</span>
                <#else><span></span></#if>
            </td>
        </tr>
    </table>
    <div class="div-footer">
        <hr style="position: relative;">
        <div style="position: relative;text-align: center;" class="footer">
            <span style="float: left;">PF-135E (2021)</span>
            <span>© Queen''s Printer for Ontario</span>
            <span style="float: right">Page 13 of 13</span>
        </div>
    </div>

</div>
</body>
</html>', true, 1, 'dms_template', current_timestamp);



