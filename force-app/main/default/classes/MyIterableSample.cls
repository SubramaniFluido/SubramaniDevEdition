public class MyIterableSample implements Iterable<String>{
   public Iterator<String> iterator() {
       system.debug('Inside class');
      return new Set<String>{'Hello', 'World!'}.iterator();
   }
}