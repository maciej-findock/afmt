global with sharing class ActionClass {

    @InvocableMethod(label='Do Action' description='Performs the action.' category='Custom' callout=true)
    global static List<Result> execute(List<Request> requests) {
        return null;
    }
}

public with sharing class Scheduled implements Schedulable {

    /**
     * Entry point called by the scheduler.
     */
    public void execute(SchedulableContext ctx) {
        doWork();
    }
}
