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
                    <span id="printId">xxxxxxxxx</span><br><br>
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
                    <div>We are pleased to inform you that as a result of your employment with ${employer_name}, you are eligible to join the OMERS Primary Pension Plan (the OMERS Plan) ??? a defined benefit pension with more than half a million members and over 1,000 participating employers across Ontario.</div><br>
                    <div>To help you learn about the features of the OMERS Plan, we have enclosed a copy of the latest <span class="bold">OMERS Member Handbook.</span> We encourage you to review it carefully and visit <span>omers.com</span> for more information.</div><br>
                    <div>We have also enclosed an <span class="bold">Offer of OMERS Membership</span> form. <span class="bold">Please complete and sign this form, and return it to your employer.</span> It is important that you complete the form even if you choose <span class="underline">not</span> to become a member, as your employer needs to obtain a record of your decision.</div><br>
                    <div>If you choose to join, your enrolment in the OMERS Plan will take effect in your employer???s next available pay period after your election is received. This date can be no later than the end of the month following the month in which the election is received.</div><br>
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
                    <div class="bold underline">I???m an existing member</div><br>
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
                <img src="https://images.ctfassets.net/iifcbkds7nke/540G9DsNiql30rGXFrVF56/259888fd3c5071d49317a4a748abe366/OMERS_MEMBERSHIP_OFFER_PAGE_1.png"
                alt="Page1" title="Page1">
            </span>
        </section>
        <section size="A4">
            <span class="content">
                <img src="https://images.ctfassets.net/iifcbkds7nke/7chMvd5IYXAXpkxuT5DLdi/191e59253cbe418581439b7e7ca70d69/OMERS_MEMBERSHIP_OFFER_PAGE_2.png"
                alt="Page2" title="Page2">
            </span>
        </section>
    </body>
</html>
', template_fields = '[ { "defaultValue": "", "fieldName": "firstName", "fieldType": "STRING", "isRequired": true }, { "defaultValue": "", "fieldName": "lastName", "fieldType": "STRING", "isRequired": true }, { "defaultValue": "", "fieldName": "address", "fieldType": "STRING", "isRequired": true }, { "defaultValue": "", "fieldName": "address2", "fieldType": "STRING", "isRequired": false }, { "defaultValue": "", "fieldName": "apt_suite_unit", "fieldType": "STRING", "isRequired": false }, { "defaultValue": "", "fieldName": "city", "fieldType": "STRING", "isRequired": true }, { "defaultValue": "", "fieldName": "provinceState", "fieldType": "STRING", "isRequired": true }, { "defaultValue": "", "fieldName": "postalZip", "fieldType": "STRING", "isRequired": true }, { "defaultValue": "", "fieldName": "country", "fieldType": "STRING", "isRequired": true }, { "defaultValue": "", "fieldName": "employer_name", "fieldType": "STRING", "isRequired": true }, { "defaultValue": "", "fieldName": "eligible_participation_date", "fieldType": "STRING", "isRequired": true }, { "defaultValue": "", "fieldName": "membership_form_submission_date", "fieldType": "STRING", "isRequired": true }, { "defaultValue": "", "fieldName": "possibleEarlyEnrolmentFlag", "fieldType": "BOOLEAN", "isRequired": true }, { "defaultValue": "", "fieldName": "nftMatchFlag", "fieldType": "BOOLEAN", "isRequired": true }, { "defaultValue": "", "fieldName": "activeMemberMatchFlag", "fieldType": "BOOLEAN", "isRequired": true }, { "defaultValue": "", "fieldName": "deferredMemberMatchFlag", "fieldType": "BOOLEAN", "isRequired": true } ]'
where template_id = '6ffd6a5a-198e-11ed-861d-0242ac120019';

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
                    <span id="printId">xxxxxxxxx</span><br><br>
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
                <div class="subHeader">Vous ??tes admissibles ?? participer au r??gime d???OMERS</div>
                <span class="content">
                    <div>Bonjour ${firstName},</div><br>
                    <div>Nous avons le plaisir de vous informer qu???en raison de votre emploi chez ${employer_name}, vous ??tes admissibles au r??gime de retraite principal d???OMERS (le r??gime d???OMERS), soit une retraite ?? prestations d??termin??es comptant plus d???un demi-million de participant(e)s et plus de 1,000 employeurs membres dans tout l???Ontario.</div><br>
                    <div>Pour vous aider ?? en savoir plus sur les caract??ristiques du r??gime d???OMERS, nous avons joint une copie du tout dernier <span class="bold">Guide du participant d''OMERS.</span> Nous vous encourageons ?? l???examiner attentivement et ?? consulter le site <span>omers.com</span> pour en savoir plus.</div><br>
                    <div>Nous avons ??galement joint un formulaire d???<span class="bold">offre de participation au r??gime d???OMERS. Veuillez remplir et signer ce formulaire et le retourner ?? votre employeur</span>. Il est important de remplir ce formulaire m??me si vous d??cidez de <span class="underline">ne pas</span> participer au r??gime, car votre employeur doit obtenir une preuve de votre d??cision.</div><br>
                    <div>Si vous choisissez d???y participer, votre adh??sion au r??gime d???OMERS prendra effet au cours de la p??riode de paie disponible de votre employeur qui suit la r??ception de votre choix. Cette date peut ??tre au plus tard ?? la fin du mois suivant le mois au cours duquel le choix est re??u.</div><br>
                    <div>Si vous choisissez de ne pas y participer ?? l???heure actuelle, vous pourrez tout de m??me adh??rer ult??rieurement si vous ??tes employ??(e) par un employeur d???OMERS. Dans ce cas, communiquez avec votre employeur pour commencer votre adh??sion.</div><br>

                    <#if possibleEarlyEnrolmentFlag==true>
                    <div class="bold underline">Vous avez la possibilit?? d???y adh??rer plus t??t</div><br>
                    <div>Nos dossiers indiquent que vous ??tiez admissible ?? participer au r??gime d???OMERS en date du ${eligible_participation_date}.</div><br>
                    <div>Si vous souhaitez devenir membre ?? cette date anticip??e, vous avez la possibilit?? de verser les cotisations que vous auriez vers??es pendant cette p??riode et votre employeur versera une somme ??quivalente. Pour faire ce choix, veuillez soumettre votre formulaire d???offre de participation au r??gime d???OMERS d??ment rempli ?? votre employeur d???ici le ${membership_form_submission_date}. Une fois votre choix re??u et que nous aurons recueilli des renseignements suppl??mentaires aupr??s de votre employeur, OMERS vous enverra plus de d??tails, y compris le co??t des cotisations.</div><br>
                    <div>Si vous soumettez votre formulaire d???offre de participation au r??gime d???OMERS d??ment rempli <span class="bold">apr??s</span> le ${membership_form_submission_date}, vous <span class="underline">renoncez ?? votre droit de profiter de cette date de participation anticip??e et ?? la possibilit?? pour votre employeur de verser une cotisation ??quivalente ?? la v??tre pour cette p??riode ant??rieure.</span> Le temps ??coul?? entre votre date d???adh??sion et votre date de participation anticip??e sera consid??r?? comme un service validable dans le cadre du r??gime d???OMERS. Il se peut que vous puissiez acheter cette p??riode ?? une date ult??rieure sous forme de rachat ?? vos frais. Ce co??t est souvent plus ??lev?? que celui de vos cotisations r??guli??res. Pour en savoir plus sur le service validable et les rachats, veuillez consulter le Guide du participant d''OMERS.</div><br>
                    </#if>

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

                    <#if nftMatchFlag==true>
                    <div class="bold underline">Pourquoi est-ce que je re??ois plusieurs trousses?</div><br>
                    <div>Dans le cadre de cette offre d???adh??sion, vous avez plusieurs occasions de vous inscrire au r??gime d???OMERS parce que vous occupez plus d???un poste chez des employeurs d???OMERS (ou au sein d???un employeur d???OMERS). Par cons??quent, vous pouvez vous attendre ?? recevoir plusieurs trousses d???adh??sion.</div><br>
                    <div>Si vous choisissez d???adh??rer dans le cas de plus d???un poste chez votre ou vos employeurs d???OMERS, chacune de vos participations sera trait??e s??par??ment et, par cons??quent, votre rente sera calcul??e s??par??ment (c.-??-d., les gains et le service valid?? de chaque poste ne s???appliqueront qu????? cette adh??sion aux fins du calcul de votre rente d???OMERS). La p??riode de service aupr??s de tous vos employeurs d???OMERS peut ??tre prise en compte lors de la d??termination de votre rente de retraite anticip??e.</div><br>
                    </#if>

                    <#if (
                        (possibleEarlyEnrolmentFlag==true && nftMatchFlag==false && activeMemberMatchFlag==true && deferredMemberMatchFlag==true)
                        ||
                        (possibleEarlyEnrolmentFlag==false && nftMatchFlag==false && activeMemberMatchFlag==true && deferredMemberMatchFlag==true)
                        ||
                        (possibleEarlyEnrolmentFlag==false && nftMatchFlag==true && activeMemberMatchFlag==false && deferredMemberMatchFlag==true)
                        ||
                        (possibleEarlyEnrolmentFlag==true && nftMatchFlag==false && activeMemberMatchFlag==true && deferredMemberMatchFlag==false)
                        ||
                        (possibleEarlyEnrolmentFlag==true && nftMatchFlag==false && activeMemberMatchFlag==false && deferredMemberMatchFlag==true)
                    )>
                    <div class="page-break"></div>
                    <div class="pageHeader">
                        <span class="headerLeft"><img src="OMERS_LOGO_TRANSPARENT_BACKGROUND" width=''150''  alt="OMERS"/></span>
                    </div>
                    </#if>

                    <#if activeMemberMatchFlag==true>
                    <div class="bold underline">Je participe d??j?? au r??gime</div><br>
                    <div>En tant que participant existant d???OMERS, si vous choisissez de participer dans la cadre d???un autre poste, votre participation suppl??mentaire est trait??e s??par??ment et, par cons??quent, votre rente est calcul??e s??par??ment (c.-??-d., les gains et le service valid?? de chaque poste ne s???appliqueront qu????? cette participation). La p??riode de service aupr??s de tous vos employeurs d???OMERS peut ??tre prise en compte lors de la d??termination de votre rente de retraite anticip??e.</div><br>
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
                    <div class="bold underline">J???ai une rente diff??r??e d???OMERS</div><br>
                    <div>En tant que participant d???OMERS ?? rente diff??r??e qui a conserv?? sa rente dans le r??gime d???OMERS, si vous choisissez de participer ?? nouveau au r??gime d???OMERS en tant que participant actif dans le cadre de votre emploi actuel, votre ancienne participation ?? OMERS et cette nouvelle participation peuvent ??tre combin??es en une seule participation.</div><br>
                    <div>Si vous remplissez les conditions pour que vos participations soient fusionn??es, OMERS effectuera automatiquement cette transaction pour votre compte. Dans ce cas, la participation combin??e est trait??e comme une seule participation. Cela signifie que la r??mun??ration et le service pour vos p??riodes distinctes de participation au r??gime d???OMERS seront pris en compte ensemble pour d??terminer votre rente combin??e d???OMERS au moment de votre retraite.</div><br>
                    </#if>

                    <div>Consultez le site <span class="bold">https://www.omers.com/nft-fr</span> pour en savoir plus sur les avantages offerts par la participation, la proc??dure d???adh??sion et la fa??on dont le r??gime d???OMERS fonctionne, qui vous permet de b??n??ficier d???une s??curit?? financi??re ?? la retraite.</div><br>

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

                    <div>Vous pouvez ??galement communiquer avec l?????quipe de l???Exp??rience des participants d???OMERS pour obtenir des r??ponses ?? vos questions par t??l??phone du lundi au vendredi, de 8 h ?? 17 h, au 416 369-2445 ou au 1 855 669-2445.</div><br>
                    <div>Cordialement,<br>OMERS</div>

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
                <img src="https://images.ctfassets.net/iifcbkds7nke/2wVGmnVoVjMFpdwc5xgpKj/740170958dfb23a4ed09b7a70d13a356/104_fr-1.png"
                alt="Page1" title="Page1">
            </span>
        </section>
        <section size="A4">
            <span class="content">
                <img src="https://images.ctfassets.net/iifcbkds7nke/7n5V7QSRCcngkl5hzYocPZ/12e1acfa48fdb07c17de5bffb094ad7d/104_fr-2.png"
                alt="Page2" title="Page2">
            </span>
        </section>
    </body>
</html>
', template_fields = '[ { "defaultValue": "", "fieldName": "firstName", "fieldType": "STRING", "isRequired": true }, { "defaultValue": "", "fieldName": "lastName", "fieldType": "STRING", "isRequired": true }, { "defaultValue": "", "fieldName": "address", "fieldType": "STRING", "isRequired": true }, { "defaultValue": "", "fieldName": "address2", "fieldType": "STRING", "isRequired": false }, { "defaultValue": "", "fieldName": "apt_suite_unit", "fieldType": "STRING", "isRequired": false }, { "defaultValue": "", "fieldName": "city", "fieldType": "STRING", "isRequired": true }, { "defaultValue": "", "fieldName": "provinceState", "fieldType": "STRING", "isRequired": true }, { "defaultValue": "", "fieldName": "postalZip", "fieldType": "STRING", "isRequired": true }, { "defaultValue": "", "fieldName": "country", "fieldType": "STRING", "isRequired": true }, { "defaultValue": "", "fieldName": "employer_name", "fieldType": "STRING", "isRequired": true }, { "defaultValue": "", "fieldName": "eligible_participation_date", "fieldType": "STRING", "isRequired": true }, { "defaultValue": "", "fieldName": "membership_form_submission_date", "fieldType": "STRING", "isRequired": true }, { "defaultValue": "", "fieldName": "possibleEarlyEnrolmentFlag", "fieldType": "BOOLEAN", "isRequired": true }, { "defaultValue": "", "fieldName": "nftMatchFlag", "fieldType": "BOOLEAN", "isRequired": true }, { "defaultValue": "", "fieldName": "activeMemberMatchFlag", "fieldType": "BOOLEAN", "isRequired": true }, { "defaultValue": "", "fieldName": "deferredMemberMatchFlag", "fieldType": "BOOLEAN", "isRequired": true } ]'
where template_id = '6ffd6a5a-198e-11ed-861d-0242ac120020';

