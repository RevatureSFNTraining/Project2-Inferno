({
    handleSearch : function(component, String) {
        component.set("v.searchString", String);
    },

    //Currently Unused
    handleDisplay : function(cmp, query) {
        if (query != null){
            //Filter Movie Reels
        }
    },
    
    checkSearch : function(component){
        if (component.get("v.searchString") == ""){
            return false;
        }
        else{
            return true;
        }
    },

    redirectSignup : function(component){
        var urlEvent = component.get("e.force:navigateToURL");
        urlEvent.setParams({
            "url" : "/Signup"
        });
        urlEvent.fire();
    },

    redirectHelp : function(component){
        var urlEvent = component.get("e.force:navigateToURL");
        urlEvent.setParams({
            "url" : "/Help"
        });
        urlEvent.fire();
    },

    redirectWatch : function(component){
        var urlEvent = component.get("e.force:navigateToURL");
        urlEvent.setParams({
            "url" : "/Watch"
        });
        urlEvent.fire();
    },
})
