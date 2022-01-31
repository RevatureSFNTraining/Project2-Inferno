({
    handleSearch : function(component, String) {
        component.set("v.searchString", String);
    },

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
    }
})
