({
    doInit: function (component, event, helper) {
        console.log("Initialiation completed");
        // build a list of 100 words
        let gameMode= component.get("v.gameMode");
        let column=0;
        if(gameMode && gameMode=== 'easy'){
            column= 3;
        }else if(gameMode && gameMode=== 'hard'){
            column= 6;
        }else if(gameMode && gameMode=== 'medium'){
            column= 4;
        }
        let columnSize= 12/column;
        component.set("v.columSize", columnSize);
        const words = helper.getWords(column * column);
        component.set("v.words", words);
        console.log("Words: " + words);
        // get win word
        const winWord = helper.getWinWord(words);
        component.set("v.winWord", winWord);
        component.set("v.disableClick", false);
        component.set("v.clickCount", 0);
        component.set("v.result", " ");
        console.log("Win word: " + helper.getWinWord(words));
    },

    handleBlockClickEvent: function(component, event, helper){
        const value= event.getParam("value");
        let winWord= component.get("v.winWord");
        let clickCount= component.get("v.clickCount") +1;
        if(value===winWord){
            component.set("v.result", "YOU WIN THE GAME");
            component.set("v.disableClick", true);
            helper.fireResultEvent("win");
        }
        if(clickCount==3){
            component.set("v.disableClick", true);
            component.set("v.result", "YOU LOSE THE GAME");
            helper.fireResultEvent("lost");
        }
        component.set("v.clickCount",clickCount );
    }

});