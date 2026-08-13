trigger testPlatformEvtTrigger on TestEvent__e (after insert) {
      system.debug('I am inside platform event trigger');
    for(TestEvent__e eve: Trigger.New){
        system.debug('I am inside platform event for loop');
    }
}