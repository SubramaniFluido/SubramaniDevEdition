({
    init : function(component, event) {
        var action= component.get('c.CovidData');
        action.setCallback(this, function(response){
            var responseValue= response.getReturnValue();
            console.log('responseValue', responseValue);
            component.set('v.CovidList',responseValue);
            if(responseValue && responseValue[0])
            {
                var lastupdate= responseValue[0].lastupdatedtime;
                var date=lastupdate.split(" ");
                // console.log(date);
                // var newdate= date[0];
                // var newtime= date[1];
                component.set('v.Date',date[0]);
                component.set('v.Time',date[1]);
                //console.log('new date',newdate,'new time ',newtime);
                // alert(time);
            }
        },'ALL');
        $A.enqueueAction(action);
    }
})