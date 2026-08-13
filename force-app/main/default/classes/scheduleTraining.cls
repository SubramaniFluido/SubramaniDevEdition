global class scheduleTraining implements Schedulable {
	global void execute(SchedulableContext sc){
		batchTraining b= new batchTraining();
		Database.executebatch(b);
	}
}