// Israel Escobedo, Project 2, 02/03/2022

({
    // Method used in the Log Out button in markup.
    handleLogOut : function (cmp, event, helper) {

        // An alert message appears indicating tha the user has logged out of the Account poage.
        alert("You logged out of your Jolly Account.");

        // When the button is clicked the user is transferred to the Browsing page component.
        var evt = $A.get("e.force:navigateToComponent");
        evt.setParams({
            componentDef : "c:myComponent",
            componentAttributes: {
                contactId : component.get("v.contact.Id")
            }
        });
        evt.fire()
    }
});
