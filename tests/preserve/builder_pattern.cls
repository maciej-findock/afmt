public class Test {
    void m() {
        LogBuilder logBuilder = new LogBuilder('Warning', LogType.Error)
            .addToLog('error', errorMsg)
            .addToLog('old_record', JSON.serialize(oldRecord))
            .addToLog('new_record', JSON.serialize(record));

        Object instance = Type.forName(obj.Package__c, obj.TypeName__c).newInstance();
    }
}
