<aura:application extends="force:slds">
	<div class="slds">
        <div class="slds-page-header">
          <div class="slds-grid">
            <div class="slds-col slds-has-flexi-truncate">
              <p class="slds-text-heading--label">Surveys</p>
              <div class="slds-grid">
                <div class="slds-grid slds-type-focus slds-no-space">
                  <h1 class="slds-text-heading--medium slds-truncate" title="All Surveys">All Surveys</h1>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        <div class="slds-col--padded slds-p-top--large">
            <c:SurveyPageForm />
        </div>
    </div>
</aura:application>