({
    handleSearch : function(component, event, helper) {
        helper.handleSearch(component, event.data);
    },

    //Currently Unused
    // handleDisplay : function (component, event, helper) {
    //     helper.handleDisplay(component, event.data);
    // },

    checkSearch : function (component, event, helper){
        helper.checkSearch(component, event.data);
    },

    redirectSignUp : function (component, event, helper){
        helper.redirectSignUp(component);
    },

    redirectHelp : function (component, event, helper){
        helper.redirectHelp(component);
    },

    redirectWatch : function (component, event, helper){
        helper.redirectWatch(component);
    }
})
