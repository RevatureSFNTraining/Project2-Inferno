({
    handleSearch : function(component, event, helper) {
        helper.handleSearch(component, event.data);
    },

    //Currently Unused
    handleDisplay : function (component, event, helper) {
        helper.handleDisplay(component, event.data);
    },

    checkSearch : function (component, helper){
        helper.checkSearch(component);
    },

    redirectSignUp : function (component, helper){
        helper.redirectSignUp(component);
    },

    redirectHelp : function (component, helper){
        helper.redirectHelp(component);
    },

    redirectWatch : function (component, helper){
        helper.redirectWatch(component);
    }
})
