({
    handleSearch : function(component, String) {
        component.set("v.searchString", String);
    },

    //Currently Unused
    // handleDisplay : function(component, query) {
    //     if (query != null){
    //         //Filter Movie Reels
    //     }
    // },
    
    checkSearch : function(component){
        if (component.get("v.searchString") == "" || component.get("v.searchString") == " "){
            component.set("v.searching", false);
        }
        else{
            component.set("v.searching", true);
        }
    },

    redirectSignup : function(){
        var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({
            "url" : "/Signup"
        });
        urlEvent.fire();
    },

    redirectHelp : function(){
        var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({
            "url" : "/Help"
        });
        urlEvent.fire();
    },

    redirectWatch : function(){
        var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({
            "url" : "/Watch"
        });
        urlEvent.fire();
    },
})
