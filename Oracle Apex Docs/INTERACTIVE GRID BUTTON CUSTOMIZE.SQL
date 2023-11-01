01. REGION TO ATTRIBUTE :

    INITIALIZING JAVASCRIPT CODE:

    function(config) {
    
    var $ = apex.jQuery,
        toolbarData = $.apex.interactiveGrid.copyDefaultToolbar(),  
        toolbarGroup = toolbarData.toolbarRemove("search"); toolbarGroup = toolbarData.toolbarRemove("reports"); toolbarGroup = toolbarData.toolbarRemove("views");          
        toolbarGroup = toolbarData.toolbarRemove("actions2"); toolbarGroup = toolbarData.toolbarRemove("actions3");       
        toolbarGroup = toolbarData.toolbarRemove("actions4"); toolbarGroup = toolbarData.toolbarFind("actions1");         
        
          
        
        toolbarGroup.controls.push({
            type: "BUTTON",
            label: "Delete Row(s)",
            action: "selection-delete",
            icon: "icon-ig-delete",
            iconBeforeLabel: true,
            hot: true
        });

       

        toolbarGroup.controls.push({
            type: "BUTTON",
            label: "Save",
            action: "Save",
            icon: "icon-ig-save",
            iconBeforeLabel: true,
            hot: true
        });

        toolbarGroup.controls.push({
            type: "BUTTON",
            label: "Update",
            action: "Update",
            icon: "icon-ig-save",
            iconBeforeLabel: true,
            hot: true
        });

        toolbarGroup.controls.push({
            type: "BUTTON",
            label: "Add Row(s)",
            action: "selection-add-row",
            icon: "icon-ig-add-row",
            iconBeforeLabel: true,
            hot: true
        });  
        config.toolbarData = toolbarData;
        return config;
}