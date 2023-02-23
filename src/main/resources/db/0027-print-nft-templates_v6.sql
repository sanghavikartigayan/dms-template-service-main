update dmstemplate.template SET template_data = '<!DOCTYPE html>
<html>
    <head>
        <style>
            body {
                margin-left: auto;
                margin-right: auto;
            }
            section {
                display: block;
                margin: 0 auto;
                padding: 0;
            }
            section[size="A4"] {
                width: 8.5in;
                height: 11in;
            }
            @page {
                size: 215.9mm 279.4mm;
                margin:0;
            }
            section > #margins {
                max-width: 100%;
                display: block;
                padding-left: 35mm;
                padding-top: 65mm;
            }
            #margins > #content {
                display:block;
                font-size: 11pt;
                font-family: Arial, Helvetica, sans-serif;
                width: 80mm;
                height: 30mm;
            }
            .bold {
                font-weight: bold;
            }
            #printId {
                font-size: 9pt;
            }
            .content > img {
                position: relative;
                top: 0;
                left: 0;
                width: 8.5in;
                height: 10.95in;
            }
            .pageHeader{
                padding-top: 10.9mm;
                padding-bottom: 20px;
                display:inline-block;
                width:100%;
            }
            .headerLeft{
                float:left;
                font-family: Arial, Helvetica, sans-serif;
            }
            section > .horizontalMargins {
                padding-left:25.4mm;
                width:165.1mm;
                display: block;
            }
            .content {
                font-size: 11pt;
                font-family: Arial, Helvetica, sans-serif;
            }
            .underline {
                text-decoration: underline;
            }
            .subHeader {
                display: inline-block;
                width: 172.3mm;
                margin-top:25px;
                margin-bottom:30px;
                font-size: 16pt;
                color: #2F5596;
                text-align: center;
                font-family: Arial, Helvetica, sans-serif;
            }
            .page-break {
                display: block;
                page-break-after: always;
            }
        </style>
    </head>
    </head>
    <body>
        <section size="A4">
            <span id="margins">
                <span id="content">
                    <span id="printId"></span><br><br>
                    <span>${firstName?upper_case} ${lastName?upper_case}</span><br>
                    <span>${address?upper_case}</span><br>
                    <#if apt_suite_unit?has_content>
                    <span>${apt_suite_unit?upper_case}</span><br>
                    </#if>
                    <#if address2?has_content>
                    <span>${address2?upper_case}</span><br>
                    </#if>
                    <span>${city?upper_case} ${provinceState?upper_case}  ${postalZip?upper_case}</span><br>
                    <span>${country?upper_case}</span>
                </span>
            </span>
        </section>
        <section size="A4"></section>
        <section size="A4" style="height: 100%; box-sizing: border-box;">
            <span class="horizontalMargins">
                <div class="pageHeader">
                    <span class="headerLeft"><img src="OMERS_LOGO_TRANSPARENT_BACKGROUND" width=''150''  alt="OMERS"/></span>
                </div>
                <div class="subHeader">You''re eligible to join OMERS</div>
                <span class="content">
                    <div>Dear ${firstName},</div><br>
                    <div>We are pleased to inform you that as a result of your employment with ${employer_name}, you are eligible to join the OMERS Primary Pension Plan (the OMERS Plan) — a defined benefit pension with more than half a million members and over 1,000 participating employers across Ontario.</div><br>
                    <div>To help you learn about the features of the OMERS Plan, we have enclosed a copy of the latest <span class="bold">OMERS Member Handbook.</span> We encourage you to review it carefully and visit <span>omers.com</span> for more information.</div><br>
                    <div>We have also enclosed an <span class="bold">Offer of OMERS Membership</span> form. <span class="bold">Please complete and sign this form, and return it to your employer.</span> It is important that you complete the form even if you choose <span class="underline">not</span> to become a member, as your employer needs to obtain a record of your decision.</div><br>
                    <div>If you choose to join, your enrolment in the OMERS Plan will take effect in your employer’s next available pay period after your election is received. This date can be no later than the end of the month following the month in which the election is received.</div><br>
                    <div>If you choose not to join at the current time, you can still join in the future if you are employed with an OMERS employer. In this case, contact your employer to initiate enrolment.</div><br>

                    <#if possibleEarlyEnrolmentFlag==true>
                    <div class="bold underline">Your opportunity to enrol earlier</div><br>
                    <div>Our records indicate that you were eligible to participate in the OMERS Plan as of ${eligible_participation_date}.</div><br>
                    <div>If you would like to take advantage of this earlier participation date, you have the option to make the contributions you would have made during this period and your employer will match them. To make this election, please submit your completed Offer of OMERS Membership form to your employer by ${membership_form_submission_date}. Once your election is received and we have collected some additional information from your employer, OMERS will send you further details, including the contribution cost to you.</div><br>
                    <div>If you submit your completed Offer of OMERS Membership form <span class="bold">after</span> ${membership_form_submission_date}, you <span class="underline">are forgoing your eligibility to take advantage of this earlier participation date and having your employer match your contributions for this earlier period.</span> The time between your enrolment date and your earlier participation date will count as eligible service in the OMERS Plan. You may be able to purchase this time at a later date as a buy-back at your own cost. This cost is often higher than your regular contributions. To learn more about eligible service and buy-backs, please see the OMERS Member Handbook.</div><br>
                    </#if>

                    <#if nftMatchFlag==true>
                    <div class="bold underline">Why am I receiving multiple packages?</div><br>
                    <div>As part of this offer of enrolment, you have multiple opportunities to enrol in the OMERS Plan because you hold more than one position with OMERS employers (or within one OMERS employer). As a result, you can expect to receive several enrolment packages.</div><br>

                    <#if (
                        (possibleEarlyEnrolmentFlag==true && nftMatchFlag==true && activeMemberMatchFlag==false && deferredMemberMatchFlag==false)
                        ||
                        (possibleEarlyEnrolmentFlag==true && nftMatchFlag==true && activeMemberMatchFlag==false && deferredMemberMatchFlag==true)
                        ||
                        (possibleEarlyEnrolmentFlag==true && nftMatchFlag==true && activeMemberMatchFlag==true && deferredMemberMatchFlag==false)
                        ||
                        (possibleEarlyEnrolmentFlag==true && nftMatchFlag==true && activeMemberMatchFlag==true && deferredMemberMatchFlag==true)
                    )>
                    <div class="page-break"></div>
                    <div class="pageHeader">
                        <span class="headerLeft"><img src="OMERS_LOGO_TRANSPARENT_BACKGROUND" width=''150''  alt="OMERS"/></span>
                    </div>
                    </#if>

                    <div>If you choose to join with respect to more than one of your positions with your OMERS employer(s), each of your memberships will be treated separately and therefore your pension will be calculated separately (i.e., earnings and credited service from each position will only apply to that membership for the purpose of calculating your OMERS pension). Service with all of your OMERS employers can be taken into account when determining your early retirement pension.</div><br>
                    </#if>

                    <#if (
                        (possibleEarlyEnrolmentFlag==true && nftMatchFlag==false && activeMemberMatchFlag==true && deferredMemberMatchFlag==true)
                    )>
                    <div class="page-break"></div>
                    <div class="pageHeader">
                        <span class="headerLeft"><img src="OMERS_LOGO_TRANSPARENT_BACKGROUND" width=''150''  alt="OMERS"/></span>
                    </div>
                    </#if>

                    <#if activeMemberMatchFlag==true>
                    <div class="bold underline">I’m an existing member</div><br>
                    <div>As an existing OMERS member, if you choose to join with respect to an additional position, your additional membership will be treated separately and therefore your pension will be calculated separately (i.e., earnings and credited service from each position will only apply to that membership). Service with all of your OMERS employers may be taken into account when determining your early retirement pension.</div><br>
                    </#if>

                    <#if (
                        (possibleEarlyEnrolmentFlag==false && nftMatchFlag==true && activeMemberMatchFlag==true && deferredMemberMatchFlag==true)
                    )>
                    <div class="page-break"></div>
                    <div class="pageHeader">
                        <span class="headerLeft"><img src="OMERS_LOGO_TRANSPARENT_BACKGROUND" width=''150''  alt="OMERS"/></span>
                    </div>
                    </#if>

                    <#if deferredMemberMatchFlag==true>
                    <div class="bold underline">I have a deferred OMERS pension</div><br>
                    <div>As a deferred OMERS member who has kept their pension in the OMERS Plan, if you choose to rejoin the OMERS Plan as an active member in respect of your current employment, your prior OMERS membership and this new membership may be combined into a single membership.</div><br>

                    <#if (
                        (possibleEarlyEnrolmentFlag==true && nftMatchFlag==false && activeMemberMatchFlag==false && deferredMemberMatchFlag==true)
                    )>
                    <div class="page-break"></div>
                    <div class="pageHeader">
                        <span class="headerLeft"><img src="OMERS_LOGO_TRANSPARENT_BACKGROUND" width=''150''  alt="OMERS"/></span>
                    </div>
                    </#if>

                    <div>If you satisfy the conditions to have your memberships merged, OMERS will automatically complete this transaction on your behalf. In this case, the combined membership is treated as one single membership. This means the earnings and service for your separate periods of membership in the OMERS Plan will be considered together in determining your combined OMERS pension when you retire.</div><br>
                    </#if>

                    <#if (
                        (possibleEarlyEnrolmentFlag==false && nftMatchFlag==false && activeMemberMatchFlag==true && deferredMemberMatchFlag==true)
                        ||
                        (possibleEarlyEnrolmentFlag==false && nftMatchFlag==true && activeMemberMatchFlag==false && deferredMemberMatchFlag==true)
                        ||
                        (possibleEarlyEnrolmentFlag==true && nftMatchFlag==false && activeMemberMatchFlag==true && deferredMemberMatchFlag==false)
                    )>
                    <div class="page-break"></div>
                    <div class="pageHeader">
                        <span class="headerLeft"><img src="OMERS_LOGO_TRANSPARENT_BACKGROUND" width=''150''  alt="OMERS"/></span>
                    </div>
                    </#if>

                    <div>Visit <span class="bold">https://www.omers.com/nft</span> to read about the benefits of membership, the process for enrolment and how the OMERS Plan works to help provide you with financial security in retirement.</div><br>

                    <#if (
                        (possibleEarlyEnrolmentFlag==false && nftMatchFlag==true && activeMemberMatchFlag==true && deferredMemberMatchFlag==false)
                        ||
                        (possibleEarlyEnrolmentFlag==true && nftMatchFlag==false && activeMemberMatchFlag==false && deferredMemberMatchFlag==false)
                    )>
                    <div class="page-break"></div>
                    <div class="pageHeader">
                        <span class="headerLeft"><img src="OMERS_LOGO_TRANSPARENT_BACKGROUND" width=''150''  alt="OMERS"/></span>
                    </div>
                    </#if>

                    <div>You can also call the OMERS Member Experience team to have your questions answered by phone from Monday to Friday between 8:00 a.m. and 5:00 p.m. at 416.369.2445 or 1.855.669.2445.</div><br>
                    <div>Sincerely,<br>OMERS</div>

                    <#if (
                        (possibleEarlyEnrolmentFlag==false && nftMatchFlag==false && activeMemberMatchFlag==false && deferredMemberMatchFlag==false)
                        ||
                        (possibleEarlyEnrolmentFlag==false && nftMatchFlag==false && activeMemberMatchFlag==false && deferredMemberMatchFlag==true)
                        ||
                        (possibleEarlyEnrolmentFlag==false && nftMatchFlag==false && activeMemberMatchFlag==true && deferredMemberMatchFlag==false)
                        ||
                        (possibleEarlyEnrolmentFlag==false && nftMatchFlag==true && activeMemberMatchFlag==false && deferredMemberMatchFlag==false)
                    )>
                    <section size="A4"></section>
                    </#if>
                </span>
            </span>
        </section>
        <section size="A4">
            <span class="content">
                <img src="https://images.ctfassets.net/iifcbkds7nke/540G9DsNiql30rGXFrVF56/e26733e7c3f602864242174831607dc6/104_en-1.png.png"
                alt="Page1" title="Page1">
            </span>
        </section>
        <section size="A4">
            <span class="content">
                <img src="https://images.ctfassets.net/iifcbkds7nke/7chMvd5IYXAXpkxuT5DLdi/80039b6aa8e2a414dbb2acb838c3f2a9/104_en-2.png"
                alt="Page2" title="Page2">
            </span>
        </section>
    </body>
</html>
' where template_id = '6ffd6a5a-198e-11ed-861d-0242ac120019';

update dmstemplate.template_history SET template_data = '<!DOCTYPE html>
<html>
    <head>
        <style>
            body {
                margin-left: auto;
                margin-right: auto;
            }
            section {
                display: block;
                margin: 0 auto;
                padding: 0;
            }
            section[size="A4"] {
                width: 8.5in;
                height: 11in;
            }
            @page {
                size: 215.9mm 279.4mm;
                margin:0;
            }
            section > #margins {
                max-width: 100%;
                display: block;
                padding-left: 35mm;
                padding-top: 65mm;
            }
            #margins > #content {
                display:block;
                font-size: 11pt;
                font-family: Arial, Helvetica, sans-serif;
                width: 80mm;
                height: 30mm;
            }
            .bold {
                font-weight: bold;
            }
            #printId {
                font-size: 9pt;
            }
            .content > img {
                position: relative;
                top: 0;
                left: 0;
                width: 8.5in;
                height: 10.95in;
            }
            .pageHeader{
                padding-top: 10.9mm;
                padding-bottom: 20px;
                display:inline-block;
                width:100%;
            }
            .headerLeft{
                float:left;
                font-family: Arial, Helvetica, sans-serif;
            }
            section > .horizontalMargins {
                padding-left:25.4mm;
                width:165.1mm;
                display: block;
            }
            .content {
                font-size: 11pt;
                font-family: Arial, Helvetica, sans-serif;
            }
            .underline {
                text-decoration: underline;
            }
            .subHeader {
                display: inline-block;
                width: 172.3mm;
                margin-top:25px;
                margin-bottom:30px;
                font-size: 16pt;
                color: #2F5596;
                text-align: center;
                font-family: Arial, Helvetica, sans-serif;
            }
            .page-break {
                display: block;
                page-break-after: always;
            }
        </style>
    </head>
    </head>
    <body>
        <section size="A4">
            <span id="margins">
                <span id="content">
                    <span id="printId"></span><br><br>
                    <span>${firstName?upper_case} ${lastName?upper_case}</span><br>
                    <span>${address?upper_case}</span><br>
                    <#if apt_suite_unit?has_content>
                    <span>${apt_suite_unit?upper_case}</span><br>
                    </#if>
                    <#if address2?has_content>
                    <span>${address2?upper_case}</span><br>
                    </#if>
                    <span>${city?upper_case} ${provinceState?upper_case}  ${postalZip?upper_case}</span><br>
                    <span>${country?upper_case}</span>
                </span>
            </span>
        </section>
        <section size="A4"></section>
        <section size="A4" style="height: 100%; box-sizing: border-box;">
            <span class="horizontalMargins">
                <div class="pageHeader">
                    <span class="headerLeft"><img src="OMERS_LOGO_TRANSPARENT_BACKGROUND" width=''150''  alt="OMERS"/></span>
                </div>
                <div class="subHeader">You''re eligible to join OMERS</div>
                <span class="content">
                    <div>Dear ${firstName},</div><br>
                    <div>We are pleased to inform you that as a result of your employment with ${employer_name}, you are eligible to join the OMERS Primary Pension Plan (the OMERS Plan) — a defined benefit pension with more than half a million members and over 1,000 participating employers across Ontario.</div><br>
                    <div>To help you learn about the features of the OMERS Plan, we have enclosed a copy of the latest <span class="bold">OMERS Member Handbook.</span> We encourage you to review it carefully and visit <span>omers.com</span> for more information.</div><br>
                    <div>We have also enclosed an <span class="bold">Offer of OMERS Membership</span> form. <span class="bold">Please complete and sign this form, and return it to your employer.</span> It is important that you complete the form even if you choose <span class="underline">not</span> to become a member, as your employer needs to obtain a record of your decision.</div><br>
                    <div>If you choose to join, your enrolment in the OMERS Plan will take effect in your employer’s next available pay period after your election is received. This date can be no later than the end of the month following the month in which the election is received.</div><br>
                    <div>If you choose not to join at the current time, you can still join in the future if you are employed with an OMERS employer. In this case, contact your employer to initiate enrolment.</div><br>

                    <#if possibleEarlyEnrolmentFlag==true>
                    <div class="bold underline">Your opportunity to enrol earlier</div><br>
                    <div>Our records indicate that you were eligible to participate in the OMERS Plan as of ${eligible_participation_date}.</div><br>
                    <div>If you would like to take advantage of this earlier participation date, you have the option to make the contributions you would have made during this period and your employer will match them. To make this election, please submit your completed Offer of OMERS Membership form to your employer by ${membership_form_submission_date}. Once your election is received and we have collected some additional information from your employer, OMERS will send you further details, including the contribution cost to you.</div><br>
                    <div>If you submit your completed Offer of OMERS Membership form <span class="bold">after</span> ${membership_form_submission_date}, you <span class="underline">are forgoing your eligibility to take advantage of this earlier participation date and having your employer match your contributions for this earlier period.</span> The time between your enrolment date and your earlier participation date will count as eligible service in the OMERS Plan. You may be able to purchase this time at a later date as a buy-back at your own cost. This cost is often higher than your regular contributions. To learn more about eligible service and buy-backs, please see the OMERS Member Handbook.</div><br>
                    </#if>

                    <#if nftMatchFlag==true>
                    <div class="bold underline">Why am I receiving multiple packages?</div><br>
                    <div>As part of this offer of enrolment, you have multiple opportunities to enrol in the OMERS Plan because you hold more than one position with OMERS employers (or within one OMERS employer). As a result, you can expect to receive several enrolment packages.</div><br>

                    <#if (
                        (possibleEarlyEnrolmentFlag==true && nftMatchFlag==true && activeMemberMatchFlag==false && deferredMemberMatchFlag==false)
                        ||
                        (possibleEarlyEnrolmentFlag==true && nftMatchFlag==true && activeMemberMatchFlag==false && deferredMemberMatchFlag==true)
                        ||
                        (possibleEarlyEnrolmentFlag==true && nftMatchFlag==true && activeMemberMatchFlag==true && deferredMemberMatchFlag==false)
                        ||
                        (possibleEarlyEnrolmentFlag==true && nftMatchFlag==true && activeMemberMatchFlag==true && deferredMemberMatchFlag==true)
                    )>
                    <div class="page-break"></div>
                    <div class="pageHeader">
                        <span class="headerLeft"><img src="OMERS_LOGO_TRANSPARENT_BACKGROUND" width=''150''  alt="OMERS"/></span>
                    </div>
                    </#if>

                    <div>If you choose to join with respect to more than one of your positions with your OMERS employer(s), each of your memberships will be treated separately and therefore your pension will be calculated separately (i.e., earnings and credited service from each position will only apply to that membership for the purpose of calculating your OMERS pension). Service with all of your OMERS employers can be taken into account when determining your early retirement pension.</div><br>
                    </#if>

                    <#if (
                        (possibleEarlyEnrolmentFlag==true && nftMatchFlag==false && activeMemberMatchFlag==true && deferredMemberMatchFlag==true)
                    )>
                    <div class="page-break"></div>
                    <div class="pageHeader">
                        <span class="headerLeft"><img src="OMERS_LOGO_TRANSPARENT_BACKGROUND" width=''150''  alt="OMERS"/></span>
                    </div>
                    </#if>

                    <#if activeMemberMatchFlag==true>
                    <div class="bold underline">I’m an existing member</div><br>
                    <div>As an existing OMERS member, if you choose to join with respect to an additional position, your additional membership will be treated separately and therefore your pension will be calculated separately (i.e., earnings and credited service from each position will only apply to that membership). Service with all of your OMERS employers may be taken into account when determining your early retirement pension.</div><br>
                    </#if>

                    <#if (
                        (possibleEarlyEnrolmentFlag==false && nftMatchFlag==true && activeMemberMatchFlag==true && deferredMemberMatchFlag==true)
                    )>
                    <div class="page-break"></div>
                    <div class="pageHeader">
                        <span class="headerLeft"><img src="OMERS_LOGO_TRANSPARENT_BACKGROUND" width=''150''  alt="OMERS"/></span>
                    </div>
                    </#if>

                    <#if deferredMemberMatchFlag==true>
                    <div class="bold underline">I have a deferred OMERS pension</div><br>
                    <div>As a deferred OMERS member who has kept their pension in the OMERS Plan, if you choose to rejoin the OMERS Plan as an active member in respect of your current employment, your prior OMERS membership and this new membership may be combined into a single membership.</div><br>

                    <#if (
                        (possibleEarlyEnrolmentFlag==true && nftMatchFlag==false && activeMemberMatchFlag==false && deferredMemberMatchFlag==true)
                    )>
                    <div class="page-break"></div>
                    <div class="pageHeader">
                        <span class="headerLeft"><img src="OMERS_LOGO_TRANSPARENT_BACKGROUND" width=''150''  alt="OMERS"/></span>
                    </div>
                    </#if>

                    <div>If you satisfy the conditions to have your memberships merged, OMERS will automatically complete this transaction on your behalf. In this case, the combined membership is treated as one single membership. This means the earnings and service for your separate periods of membership in the OMERS Plan will be considered together in determining your combined OMERS pension when you retire.</div><br>
                    </#if>

                    <#if (
                        (possibleEarlyEnrolmentFlag==false && nftMatchFlag==false && activeMemberMatchFlag==true && deferredMemberMatchFlag==true)
                        ||
                        (possibleEarlyEnrolmentFlag==false && nftMatchFlag==true && activeMemberMatchFlag==false && deferredMemberMatchFlag==true)
                        ||
                        (possibleEarlyEnrolmentFlag==true && nftMatchFlag==false && activeMemberMatchFlag==true && deferredMemberMatchFlag==false)
                    )>
                    <div class="page-break"></div>
                    <div class="pageHeader">
                        <span class="headerLeft"><img src="OMERS_LOGO_TRANSPARENT_BACKGROUND" width=''150''  alt="OMERS"/></span>
                    </div>
                    </#if>

                    <div>Visit <span class="bold">https://www.omers.com/nft</span> to read about the benefits of membership, the process for enrolment and how the OMERS Plan works to help provide you with financial security in retirement.</div><br>

                    <#if (
                        (possibleEarlyEnrolmentFlag==false && nftMatchFlag==true && activeMemberMatchFlag==true && deferredMemberMatchFlag==false)
                        ||
                        (possibleEarlyEnrolmentFlag==true && nftMatchFlag==false && activeMemberMatchFlag==false && deferredMemberMatchFlag==false)
                    )>
                    <div class="page-break"></div>
                    <div class="pageHeader">
                        <span class="headerLeft"><img src="OMERS_LOGO_TRANSPARENT_BACKGROUND" width=''150''  alt="OMERS"/></span>
                    </div>
                    </#if>

                    <div>You can also call the OMERS Member Experience team to have your questions answered by phone from Monday to Friday between 8:00 a.m. and 5:00 p.m. at 416.369.2445 or 1.855.669.2445.</div><br>
                    <div>Sincerely,<br>OMERS</div>

                    <#if (
                        (possibleEarlyEnrolmentFlag==false && nftMatchFlag==false && activeMemberMatchFlag==false && deferredMemberMatchFlag==false)
                        ||
                        (possibleEarlyEnrolmentFlag==false && nftMatchFlag==false && activeMemberMatchFlag==false && deferredMemberMatchFlag==true)
                        ||
                        (possibleEarlyEnrolmentFlag==false && nftMatchFlag==false && activeMemberMatchFlag==true && deferredMemberMatchFlag==false)
                        ||
                        (possibleEarlyEnrolmentFlag==false && nftMatchFlag==true && activeMemberMatchFlag==false && deferredMemberMatchFlag==false)
                    )>
                    <section size="A4"></section>
                    </#if>
                </span>
            </span>
        </section>
        <section size="A4">
            <span class="content">
                <img src="https://images.ctfassets.net/iifcbkds7nke/540G9DsNiql30rGXFrVF56/e26733e7c3f602864242174831607dc6/104_en-1.png.png"
                alt="Page1" title="Page1">
            </span>
        </section>
        <section size="A4">
            <span class="content">
                <img src="https://images.ctfassets.net/iifcbkds7nke/7chMvd5IYXAXpkxuT5DLdi/80039b6aa8e2a414dbb2acb838c3f2a9/104_en-2.png"
                alt="Page2" title="Page2">
            </span>
        </section>
    </body>
</html>
' where audit_id = 'b059f61a-e9ff-4543-b6c8-9c4e63279634';
