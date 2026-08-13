@RestResource(urlMapping='/v1/Welcome/*')
global with sharing class WelcomeClass {
    global Final static String WELCOME_MESSAGE='Welcome to my Integration Class';

    @httpGet
    global static String welcomeGet() {
        return WELCOME_MESSAGE;
    }

    @httpPost
    global static String welcomePost() {
        return WELCOME_MESSAGE;
    }

    @httpPatch
    global static String welcomePatch() {
        return WELCOME_MESSAGE +' UPDATE WITH PATCH';
    }

}