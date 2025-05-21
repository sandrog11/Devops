<aura:application extends="force:slds" >
	<div class="slds-m-top_x-small">
    	<div class="slds-m-left_x-small">
        	<div class="slds-text-heading_large">
                LIGHTNING CONTACTS
            </div>
            <div class="slds-grid slds-gutters">
                <div class="slds-col slds-size_1-of-4">
                    <c:SearchBarTot/>
                    <c:ContactListTot/>
                </div>
                <div class="slds-col slds-size_1-of-4">
                    <c:ContactDetails/>
                </div>
            </div>
        </div>
    </div>
</aura:application>