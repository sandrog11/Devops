<aura:application extends="force:slds">
    
    <div class="c-container">
        <lightning:layout multipleRows="true">
            <lightning:layoutItem padding="around-small" size="9">
                <div class="page-section page-main">
                    <c:Elenco_Posizioni/>
                </div>
            </lightning:layoutItem>
            <lightning:layoutItem padding="around-small" size="3">
                <div class="page-section page-right">
                    <br/>
                    <c:Dettagli_Candidato/>
                    <br/>
                    <c:Elenco_Siti/>
                </div>
            </lightning:layoutItem>
        </lightning:layout>
    </div>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    </aura:application>