global class SchedulableClass implements Schedulable {
    global void execute(SchedulableContext ctx) {
        FutureMethod.CreateUser('hey', 'hy');
		System.debug('hey scheduled class is called.');
    }
}