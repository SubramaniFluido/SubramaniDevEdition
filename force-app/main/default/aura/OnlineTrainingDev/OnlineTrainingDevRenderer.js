({
    render: function(component, helper){
        //must call base render method
        this.superRender();
        //custom logic 
        alert('Inside render');
    },
    
    afterRender: function(component, helper){
        //must call base afterRender method
        this.SuperAfterRender();
        alert('After render');
    },
    
    reRender: function(component, helper){
        //must call base afterRender method
        this.SuperReRender();
        alert('Re-render will update after change in the component(DOM)');
    },
    
    unRender: function(component, helper){
        //must call base afterRender method
        this.SuperUnRender();
        alert('unRe-render called after destroyed the component');
    },
    
    
})